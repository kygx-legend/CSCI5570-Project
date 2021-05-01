output_dir=knightking_dblp
graph=dblp
#output_dir=knightking_webstanford
#graph=webstanford
#output_dir=knightking_youtube
#graph=youtube
#output_dir=knightking_lj
#graph=lj

cd /data/sysu/CSCI5570-Project/cluster_monitor
./collectl.py --start -o /data/sysu/CSCI5570-Project/cluster_monitor/${output_dir} -m workers
cd /data/sysu/CSCI5570-Project/knightking
time mpiexec -np 200 -hostfile ../fora/machines.cfg ./build/bin/ppr -g ./dblp.data -v 317080 -w 10000 -s unweighted -t 0.2
#time mpiexec -np 200 -hostfile ../fora/machines.cfg ./build/bin/ppr -g ./webstanford.data -v 281904 -w 10000 -s unweighted -t 0.2
#time mpiexec -np 200 -hostfile ../fora/machines.cfg ./build/bin/ppr -g ./youtube.data -v 1134890 -w 10000 -s unweighted -t 0.2
#time mpiexec -np 200 -hostfile ../fora/machines.cfg ./build/bin/ppr -g ./lj.data -v 3997962 -w 10000 -s unweighted -t 0.2
cd /data/sysu/CSCI5570-Project/cluster_monitor
./collectl.py --stop
./plot.py ${output_dir} -o ${output_dir}-output -r
