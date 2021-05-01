#output_dir=fora_opt_dblp
#output_dir=fora_opt_dblp_800
#graph=dblp
#output_dir=fora_opt_webstanford
#output_dir=fora_opt_webstanford_800
#graph=webstanford
#output_dir=fora_opt_youtube
#output_dir=fora_opt_youtube_800
#graph=youtube
output_dir=fora_opt_lj
graph=lj

cd /data/sysu/CSCI5570-Project/cluster_monitor
./collectl.py --start -o /data/sysu/CSCI5570-Project/cluster_monitor/${output_dir} -m workers
cd /data/sysu/CSCI5570-Project/fora
time mpirun -np 200 --hostfile machines.cfg ./fora_mpi query --algo fora --prefix ./data/ --dataset ${graph} --epsilon 0.5 --with_idx --opt --balanced
#time mpirun -np 800 --hostfile machines.cfg ./fora_mpi query --algo fora --prefix ./data/ --dataset ${graph} --epsilon 0.5 --with_idx --opt --balanced
cd /data/sysu/CSCI5570-Project/cluster_monitor
./collectl.py --stop
./plot.py ${output_dir} -o ${output_dir}-output -r
