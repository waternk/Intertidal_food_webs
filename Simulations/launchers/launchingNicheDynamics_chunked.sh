#!/bin/bash

#$ -S /bin/bash

#$ -N niche_networks

 # memory / RAM
#$ -l h_vmem=2G

# job output goes here
#$ -e /work/$USER/$JOB_NAME-$JOB_ID-$TASK_ID.err


# set working directory to where you checked out your python code
#$ -wd /home/gauzens/warmingHPC/codes/

#$ -binding linear:1

# load python software
module load python/2 lapack/gcc
source ~/WarmingWebs/bin/activate || exit 1

# graph=$1
# shift

### using file parameter input:

first_line=$SGE_TASK_ID
last_line=$(( $SGE_TASK_ID + $SGE_TASK_STEPSIZE - 1 ))

sed -n "$first_line,$last_line p" $1 |
python /home/gauzens/warmingHPC/codes/dynamic_nichesHPC.py


# look to:
# https://stackoverflow.com/questions/17658512/how-to-pipe-input-to-python-line-by-line-from-linux-program
