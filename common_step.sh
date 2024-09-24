#!/bin/bash
#SBATCH -p single
#SBATCH -N 1
#SBATCH -n 20
#SBATCH -t 01:00:00
#SBATCH -o commonstep.out

/usr/bin/time \
singularity run -B /work,/project ../centos7 \
searchKeys-11-5-18.py --sample_name t1 --path ./sample_root --search_mode 0 --use_common_keys
/usr/bin/time \
singularity run -B /work,/project ../centos7 \
searchKeys_A_not_other.py --sample_name t1 --path ./sample_root --search_mode 6 --b_percent 0
