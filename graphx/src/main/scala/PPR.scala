import org.apache.spark._
import org.apache.spark.graphx._

import Array._

object PPR {
  def main(args: Array[String]) {
    val conf = new SparkConf().setAppName("PPR")
    val sc = new SparkContext(conf)

    if (args.length != 1) {
      println("no parameter")
      return
    }
    
    println(args(0))
    val graph_file = args(0)

    // Load the edges as a graph
    val graph = GraphLoader.edgeListFile(sc, "hdfs://master:9000" + graph_file)
    // Select source vertices
    val vertices: Array[VertexId] = range(0, 100).map(i => i.toLong)
    val ranks = graph.staticParallelPersonalizedPageRank(vertices, 10, 0.2)

    ranks.edges.foreach(println)
    return
  }
}
