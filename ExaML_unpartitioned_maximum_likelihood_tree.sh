## Modules loaded on HPC for analysis
module load examl/3.0.16
module load moab/9.1.0.1
module load torque/6.1.0
module load openmpi/gcc/64/1.10.2
module load raxml/8.2.11
export OMP_NUM_THREADS=1

#Set working directory, where phylip file is located
workdir= #Path of working directory
cd $workdir

prefix= #Name of phylip file for ExaML analysis
input=$prefix
runnameu=${prefix}.unpartitioned

parse-examl -s $input -m DNA -n $runnameu

raxmlHPC-AVX -y -m GTRGAMMA -p 12345 -s $input -n StartingTree

mpirun -n 52 examl-OMP -s ${prefix}.unpartitioned.binary -t RAxML_parsimonyTree.StartingTree -m GAMMA -n T1

cat ExaML_result.T1 > TreeSet

mpirun -n 52 examl-AVX -s ${prefix}.unpartitioned.binary -t TreeSet -f E -m GAMMA -n T3uE
