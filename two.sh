#!/bin/bash
# Run this command to see your slurm associations:
#   sacctmgr show assoc -p | grep wsyuweb
#
# and then configure the next three SBATCH options accordingly.
# (1) Which partition do you want to use? 
#   If you can, choose lr3. But if none of the nodes are available,
#   then feel free to try lr4, or lr5, or l6.
#   Use this command to check for idle (available) nodes:
#      sinfo -p lr3,lr4,lr5,lr6 | grep idle
#
#SBATCH --partition=lr6
# (2) Which account do you want to use?
#   You should see two accounts associated with your user name:
#      ac_fwi, and pc_exascalecomputing.
#   Run this command to see if you have any free hours (SUs for service units)
#   remaining on an account:
#      check_usage.sh -h           # See the help for more details
#      check_usage.sh -a ac_fwi
#      check_usage.sh -a pc_exascalecomputing
#      check_usage.sh -a "ac_fwi,pc_exascalecomputing"
#
#SBATCH --account=ac_fwi
# (3) Which quality of service to use?
#   Usually lr_normal is fine.
#
#SBATCH --qos=lr_normal
# (4) Feel free to change the name of this job. It's only for your own reference.
#
#SBATCH --job-name="this ia a test"
# (5) How long does this job expect to run for? 
#
# Acceptable  time  formats  include "minutes", "minutes:seconds",
# "hours:minutes:seconds", "days-hours", "days-hours:minutes" and 
# "days-hours:minutes:seconds".
#
# e.g. --time="2-0:1:2" # Request for two days, zero hours, 1 minute, 2 seconds
#
#SBATCH --time="2-0:1:2"
# Get email notifications when your jobs start/end.
#SBATCH --mail-user=suiwenw@unr.edu
#SBATCH --mail-type=all

time singularity exec /global/scratch/elam3/sif/Real-ESSI-v20.07.sif mpirun -np 20 pessi -f 3story.fei 
