# CSCI5570-Project



### GraphX

----
$ sbt package
$ YOUR_SPARK_HOME/bin/spark-submit \
  --class "SimpleApp" \
  --master local[4] \
  target/scala-2.12/simple-project_2.12-1.0.jar
----

### FORA (Modified to support MPI)

----
$ mpirun -np 40 --hostfile machines.cfg ./fora_mpi query --algo fora --prefix ./data/ --dataset webstanford --epsilon 0.5
----
