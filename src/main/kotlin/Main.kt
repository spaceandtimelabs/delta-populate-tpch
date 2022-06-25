import org.apache.spark.sql.SparkSession

fun main() {
    println("Hello, world!")

    val sparkSession = SparkSession.builder().appName("DeltaLakeSQL")
        .master("local")
        .config("spark.sql.extensions", "io.delta.sql.DeltaSparkSessionExtension")
        .config("spark.sql.catalog.spark_catalog", "org.apache.spark.sql.delta.catalog.DeltaCatalog")
        .getOrCreate()

    sparkSession.sql("CREATE TABLE customer(c_id Long, c_name String, c_city String) USING DELTA")
    sparkSession.sql("CREATE TABLE newCustomer(c_id Long, c_name String, c_city String) USING DELTA")

    sparkSession.sql("INSERT INTO  customer VALUES(1, 'John', 'New York'), (2, 'Shawn', 'California')")
    sparkSession.sql("INSERT INTO newCustomer VALUES(2, 'Shawn', 'Texas'), (3, 'Redish', 'California')")

    sparkSession.sql("SELECT * FROM customer").show()
    sparkSession.sql("SELECT * FROM newCustomer").show()
}