import org.apache.spark._
import org.apache.spark.graphx._

object PPR {
  def main(args: Array[String]) {
    val conf = new SparkConf().setAppName("PPR")
    val sc = new SparkContext(conf)

    print(args(0));
    print(args(1));
    
    return

    // Load the edges as a graph
    val graph = GraphLoader.edgeListFile(sc, "data/graphx/followers.txt")
    // Select source vertices
    val vertices: Array[VertexId] = Array((0), (1), (2))
    val ranks = graph.staticParallelPersonalizedPageRank(vertices, 10, 0.2)

  }
}
