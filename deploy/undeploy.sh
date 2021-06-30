#!/bin/bash

Namespace=$1
DeployType=$2
ServiceName=$3
ProjectID=$4

echo $Namespace
echo $DeployType
echo $ServiceName
echo $ProjectID

echo "Undeploy Through Open Horizon Exchange !!"
hzn unregister -o $HZN_ORG_ID -u $HZN_EXCHANGE_USER_AUTH -f
