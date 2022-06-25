import org.apache.spark.sql.SparkSession

fun main() {
    println("Hello, world!")

    val sparkSession = SparkSession.builder().appName("DeltaLakeSQL")
        .master("local")
        .config("spark.sql.extensions", "io.delta.sql.DeltaSparkSessionExtension")
        .config("spark.sql.catalog.spark_catalog", "org.apache.spark.sql.delta.catalog.DeltaCatalog")
        .getOrCreate()

    sparkSession.sql("""
        CREATE TEMPORARY VIEW region_csv
        USING csv 
        OPTIONS (
          path 'data/region.tbl',
          delimiter '|',
          header false,
          inferSchema true
        );
    """.trimIndent())

    sparkSession.sql("""
        create table if not exists region (
            r_regionkey INTEGER,
            r_name STRING,
            r_comment STRING
        ) USING DELTA;
    """.trimIndent())

    sparkSession.sql("""
        INSERT INTO region
        SELECT _c0, _c1, _c2 FROM region_csv
    """.trimIndent())

    sparkSession.sql("SELECT * FROM region").show()
}