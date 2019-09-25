#!/bin/bash 
   
BUCKET="" 
ZONE01="" 
ZONE02="" 
 
#if kops get --name "$(terraform output cluster_name)" --state=s3://$BUCKET; then 
if kops validate cluster "$(terraform output cluster_name)" --state=s3://$BUCKET; then
    printf "\\nCluster exists\\n"; 
    kops export kubecfg "$(terraform output cluster_name)" --state s3://$BUCKET 
    kops update cluster "$(terraform output cluster_name)" --state=s3://$BUCKET
    exit 0 
else 
    kops create cluster "$(terraform output cluster_name)" \
    --state=s3://$BUCKET \
    --zones $ZONE01,$ZONE02 \
    --node-count 3 \
    --master-count 1 \
    --vpc "$(terraform output vpc_id)" \
    --subnets "$(terraform output subnet_01_id)","$(terraform output subnet_02_id)" \
    --utility-subnets "$(terraform output subnet_utility-01_id)","$(terraform output subnet_utility-02_id)" \
    --master-security-groups "$(terraform output master_security_group_ids)" \
    --node-security-groups "$(terraform output node_security_group_ids)" \
    --networking calico \
    --topology private \
    --api-loadbalancer-type internal \
    --cloud aws \
    --ssh-public-key kopskey.pub \
    --yes 
    exit 0 
fi 
