import com.github.doyaaaaaken.kotlincsv.dsl.csvReader
import org.apache.spark.sql.SparkSession
import java.nio.file.Files
import java.nio.file.Paths
import kotlin.io.path.absolutePathString
import kotlin.io.path.nameWithoutExtension

fun main() {
    println("Hello, world!")

    val sparkSession = SparkSession.builder().appName("DeltaLakeSQL")
        .master("local")
        .config("spark.sql.extensions", "io.delta.sql.DeltaSparkSessionExtension")
        .config("spark.sql.catalog.spark_catalog", "org.apache.spark.sql.delta.catalog.DeltaCatalog")
        .getOrCreate()

    val fileContent = object{}.javaClass.classLoader.getResource("sql/schema.sql")!!.readText()
    fileContent!!.split(';')
        .filter { it.trim().isNotEmpty() }
        .forEach {
            println("Running SQL:\n$it")
            sparkSession.sql(it)
        }

    val psvReader = csvReader {
        delimiter = '|'
    }
    Files.walk(Paths.get("data/"))
        .filter { Files.isRegularFile(it) }
        .forEach { path ->
            val tableName = path.nameWithoutExtension
            sparkSession.sql("""
                CREATE TEMPORARY VIEW ${tableName}_csv
                USING csv 
                OPTIONS (
                  path 'data/$tableName.tbl',
                  delimiter '|',
                  header false,
                  inferSchema true
                );
            """.trimIndent())
            psvReader.open(path.absolutePathString()) {
                val firstLine = readAllAsSequence().first()
                val cols = (0 until firstLine.size-1)
                    .map { "_c$it" }
                    .joinToString(", ")
                sparkSession.sql("""
                    INSERT INTO $tableName
                    SELECT $cols FROM ${tableName}_csv
                """.trimIndent())
            }
        }

    sparkSession.sql("SELECT * FROM region").show()
}