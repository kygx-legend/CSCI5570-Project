# CSCI5570-Project

Acknowledgement:

1. KnightKing is cloned from https://github.com/KnightKingWalk/KnightKing.git.
2. FORA is cloned from https://github.com/wangsibovictor/fora.git and integrated with MPICH.

### GraphX


        $ sbt package
        $ YOUR_SPARK_HOME/bin/spark-submit \
            --class "SimpleApp" \
            --master local[4] \
            target/scala-2.12/simple-project_2.12-1.0.jar

### FORA (Modified to support MPI)

        $ mpirun -np 40 --hostfile machines.cfg ./fora_mpi query --algo fora --prefix ./data/ --dataset webstanford --epsilon 0.5

