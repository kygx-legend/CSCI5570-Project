#output_dir=fora_dblp
#graph=dblp
output_dir=fora_webstanford
graph=webstanford
#output_dir=fora_youtube
#graph=youtube
#output_dir=fora_lj
#graph=lj

cd /data/sysu/CSCI5570-Project/cluster_monitor
./collectl.py --start -o /data/sysu/CSCI5570-Project/cluster_monitor/${output_dir} -m workers
cd /data/sysu/CSCI5570-Project/fora
time mpirun -np 200 --hostfile machines.cfg ./fora_mpi query --algo fora --prefix ./data/ --dataset ${graph} --epsilon 0.5
cd /data/sysu/CSCI5570-Project/cluster_monitor
./collectl.py --stop
./plot.py ${output_dir} -o ${output_dir}-output -r
