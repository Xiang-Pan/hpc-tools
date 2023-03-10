#!/bin/bash

start=$(date -d"10 days ago" "+%m/%d/%y")
end=$(date "+%m/%d/%y")

echo SLURM Cluster Report $start - $end
echo "--------------------------------------------------"
echo "CPU Utilization"
sudo sreport cluster Utilization start=$start end=$end format=Cluster,Allocated,Down,Reported,TresName -t percent
echo "--------------------------------------------------"
echo JOB REPORTS
sudo sreport job SizesByAccount start=$start end=$end format=Account,Cluster -t percent grouping=2,4,16,32,64

sudo sreport cluster AccountUtilizationByUser start=$start end=$end Tree format=Accounts,Cluster,Login,Proper,TresCount,Used  -t percent 
sudo sreport clsuter UserUtilizationByAccount start=$start end=$end format=Accounts,Cluster,Login,Proper,TresCount,Used 
sudo sreport cluster UserUtilizationByWckey start=$start end=$end format=Cluster,Login,Proper,TresCount,Used,Wckey 
sudo sreport cluster WCKeyUtilizationByUser start=$start end=$end format=Cluster,Login,Proper,TresCount,Used,Wckey 

#     SizesByAccount, SizesByAccountAndWcKey, SizesByWckey 

sudo sreport job SizesByAccount start=$start end=$end
sudo sreport job SizesByAccountAndWcKey start=$start end=$end
sudo sreport job SizesByWckey start=$start end=$end

sudo sreport reservation Utilization start=$start end=$end