# get the udtime of all nodes

# get date 
date=`date +%Y%m%d`
# get the uptime of all nodes xiangpan@cluster-mgmt
ssh xiangpan@cluster-mgmt "sudo salt '*' status.uptime" > ./logs/uptime/$date.log