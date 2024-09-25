#!/bin/bash
#SBATCH -p single
#SBATCH -A loni_tsr_6
#SBATCH -N 1
#SBATCH -n 20
#SBATCH -t 20:00:00
#SBATCH -o par_tsr.out

export SIGRUN='singularity run -B /work,/project /project/wxx6941/packages/wu_sizegap.sif'

# no blank line after $SIGRUN
input_sample_folder="./sample_root/t1"

output_folder="./hdf5t"

# remove possible tailing slashes
output_folder=${output_folder%/}
input_sample_folder=${input_sample_folder%/}

$SIGRUN \
python lf_csv2_dtype_h5.py -f "$input_sample_folder" -o "$output_folder"

input_sample_name=${input_sample_folder##*/}
echo "input_sample_name=$input_sample_name"

input_h5="${output_folder}/${input_sample_name}.h5"
echo "input_h5=$input_h5"

#NPROCS=$(( $PBS_NUM_NODES*2 ))
#echo "using $NPROCS processes..."

module purge
SIGPAR="singularity exec -B /work /project/wxx6941/packages/hsp-project_latest.sif intel.mpi.impiomp.out"
SECONDS=0
srun -n 8 $SIGPAR -f $input_h5
#srun -n 8 $SIGPAR -f ./sample_hsp70_actin/sample_hsp70_actin.h5
#mpirun -np $NPROCS -f $PBS_NODEFILE -ppn 2 ./pgi.mpi.pomp.out -f $input_h5
echo "took $SECONDS sec"

$SIGRUN \
python rebuild_mat.py -f $input_h5 -csv #-validate

