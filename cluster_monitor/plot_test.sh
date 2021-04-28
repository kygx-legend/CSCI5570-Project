output_dir=5-clique-12-orkut-metis
partition_num=13
app=fiveclique

cd /data/sysu/cluster_monitor
./collectl.py --start -o /data/sysu/cluster_monitor/${output_dir} -m workers
cd /data/sysu/GMiner
time mpiexec -n ${partition_num} -f machines.cfg $GMINER_HOME/release/${app}
cd /data/sysu/cluster_monitor
./collectl.py --stop
./plot.py ${output_dir} -o ${output_dir}-output -r
rm ${output_dir}/worker14*
./plot.py ${output_dir} -o ${output_dir}-new -r
