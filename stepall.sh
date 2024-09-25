#!/bin/bash
#SBATCH -p single
#SBATCH -N 1
#SBATCH -n 20
#SBATCH -t 01:00:00
#SBATCH -o stepall.out

export SAMPLE_PATH="$PWD/sample_root/"
export SAMPLE_NAME="t1"

export SIGRUN='singularity run -B /work,/project /project/wxx6941/packages/wu_sizegap.sif'

$SIGRUN \
generate_samples.py --sample_name $SAMPLE_NAME --path $SAMPLE_PATH

$SIGRUN \
key_generation_parallel_size_gap.py --path $SAMPLE_PATH --sample_name $SAMPLE_NAME

$SIGRUN \
__main__.py --sample_name $SAMPLE_NAME --path $SAMPLE_PATH --thetaBounds '0,12.11,17.32,21.53,25.21,28.54,31.64,34.55,37.34,40.03,42.64,45.17,47.64,50.05,52.43,54.77,57.08,59.38,61.64,63.87,66.09,68.30,70.5,72.69,79.2,81.36,83.51,85.67,87.8,90' --distBounds '3.83, 7.00, 9.00, 11.00, 14.00, 17.99, 21.25, 23.19, 24.8, 26.26,27.72, 28.9, 30.36, 31.62, 32.76, 33.84, 35.13, 36.26,37.62,38.73, 40.12,41.8, 43.41, 45.55, 47.46, 49.69, 52.65, 55.81, 60.2, 64.63, 70.04, 76.15,83.26, 132.45'

$SIGRUN \
__main__MDS.py --sample_name $SAMPLE_NAME --path $SAMPLE_PATH --steps 5

