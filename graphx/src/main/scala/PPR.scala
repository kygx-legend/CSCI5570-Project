import org.apache.spark.sql.SparkSession

object PPR {
  def main(args: Array[String]) {
    val spark = SparkSession.builder.appName("PPR").getOrCreate()
    spark.stop()
  }
}
