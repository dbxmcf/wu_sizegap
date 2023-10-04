#!/bin/bash
#PBS -q workq
#PBS -l nodes=1:ppn=20
#PBS -l walltime=00:30:00
#PBS -j oe
#PBS -N common_step
#PBS -o out_common_step1_h_mix2.out

module load python/2.7.12-anaconda-tensorflow

#export NPROCS=`wc -l $PBS_NODEFILE | gawk '//{print $1}'`
#echo  "number of cores = " $NPROCS
cd $PBS_O_WORKDIR
module load python/2.7.12-anaconda-tensorflow
source activate /usr/local/packages/python/2.7.12-anaconda-wu/
export PATH=/usr/local/packages/python/2.7.12-anaconda-wu/wuportal/Sample_Generation/:$PATH
export PATH=/usr/local/packages/python/2.7.12-anaconda-wu/wuportal/Classification/lib:$PATH
export PATH=/usr/local/packages/python/2.7.12-anaconda-wu/wuportal/Classification:$PATH
export PATH=/usr/local/packages/python/2.7.12-anaconda-wu/wuportal/Motif_Discovery:$PATH

#python searchKeys-11-5-18.py --sample_name sample_h_mix2 --path ./ --search_mode 0 --use_common_keys
#python searchKeys-11-5-18.py --sample_name sample_root --path ./ --search_mode 0 --use_common_keys
/usr/bin/time searchKeys-11-5-18.py --sample_name t1 --path ./sample_root --search_mode 0 --use_common_keys

