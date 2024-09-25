# wu_sizegap

## Instructions on how to run on the LONI cluster (New users can copy and paste each command to the terminal window and run them):

1. Log onto QB3 cluster using the command:
```
ssh username@qbc.loni.org
```
2. Change to the /work directory:
```
cd /work/$USER
```
3. Clone the current repository:
```
git clone https://github.com/dbxmcf/wu_sizegap.git
```
4. Switch to the repository directory on the cluster:
```
cd wu_sizegap
```
5. Submit the first job:
```
sbatch stepall.sh
```
6. Submit the second job after the first job is complete:
```
sbatch common_step.sh
```
7. To run a parallel protein comparison, submit par_tsr.sh after the second job is complete:
```
sbatch par_tsr.sh
```
