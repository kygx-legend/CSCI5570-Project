spark-submit --class "PPR" --master spark://master:7077 --total-executor-cores 1 target/scala-2.11/personalized-pagerank-on-graphx_2.11-1.0.jar /test/dblp.txt
