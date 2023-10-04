# wu_sizegap

## Instructions on how to run on the LONI cluster (New users can copy and paste each command to the terminal window and run them):

1. Log onto QB2 cluster using the command:
```
ssh username@qb.loni.org
```
2. Change to the /work directory:
```
cd /work/$USER
```
3. Clone the current repository:
```
git clone https://github.com/dbxmcf/wu_sizegap.git
```
4. Submit the first job:
```
qsub stepall.sh
```
5. Submit the second job after the first job is complete:
```
qsub common_step.sh
```

