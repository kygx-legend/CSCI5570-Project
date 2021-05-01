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
    val vertices: Array[VertexId] = range(0, 10).map(i => i.toLong)
  
    val t0 = System.nanoTime()
    //val ranks = graph.staticParallelPersonalizedPageRank(vertices, 10, 0.2)
    //ranks.edges.foreach(println)
    for (v <- vertices) {
      val ranks = graph.staticPersonalizedPageRank(v, 10, 0.2)
      ranks.edges.foreach(println)
    }

    val t1 = System.nanoTime()
    println("Elapsed time: " + (t1 - t0) / 1000 / 1000 + "ms")
    return
  }
}
