# get all jobs for a user in slurm
$1=chenghao
# limit the max number of jobs for a user
sacctmgr -n list job where user=chenghao | wc -l