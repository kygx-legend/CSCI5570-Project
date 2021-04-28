import org.apache.spark.sql.SparkSession
import org.apache.spark.graphx.GraphLoader

object PPR {
  def main(args: Array[String]) {
    val spark = SparkSession.builder.appName("PPR").getOrCreate()

    // Load the edges as a graph
    val graph = GraphLoader.edgeListFile(sc, "data/graphx/followers.txt")
    // Select source vertices
    val vertices: Array[VertexId] = Array((), (), ())
    val ranks = graph.staticParallelPersonalizedPageRank(vertices, 10, 0.2)

    spark.stop()
  }
}
