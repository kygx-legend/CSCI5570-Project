output_dir=graphx_dblp
graph=dblp
#output_dir=graphx_webstanford
#graph=webstanford
#output_dir=graphx_youtube
#graph=youtube
#output_dir=graphx_lj
#graph=lj

cd /data/sysu/CSCI5570-Project/cluster_monitor
./collectl.py --start -o /data/sysu/CSCI5570-Project/cluster_monitor/${output_dir} -m workers
cd /data/sysu/CSCI5570-Project/graphx
spark-submit --class "PPR" --master spark://master:7077 --total-executor-cores 200 --executor-memory 40G target/scala-2.11/personalized-pagerank-on-graphx_2.11-1.0.jar /test/${graph}.txt
cd /data/sysu/CSCI5570-Project/cluster_monitor
./collectl.py --stop
./plot.py ${output_dir} -o ${output_dir}-output -r
