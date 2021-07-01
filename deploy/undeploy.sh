#!/bin/bash

Namespace=$1
DeployType=$2
ServiceName=$3
ProjectID=$4

export HZN_EXCHANGE_URL=$TargetServer
export HZN_ORG_ID="$(cut -d'@' -f2 <<<"$Username")"
export HZN_EXCHANGE_USER_AUTH="$(cut -d'@' -f1 <<<"$Username")"

echo "HZN_EXCHANGE_URL="$HZN_EXCHANGE_URL
echo "HZN_ORG_ID="$HZN_ORG_ID
echo "HZN_EXCHANGE_USER_AUTH="$HZN_EXCHANGE_USER_AUTH

echo "Undeploy Through Open Horizon Exchange !!"
hzn unregister -o $HZN_ORG_ID -u $HZN_EXCHANGE_USER_AUTH -f

hzn exchange deployment removepolicy  -v -f -o $HZN_ORG_ID -u $HZN_EXCHANGE_USER_AUTH policy-com.github.joewxboy.horizon.edgex_1.0.1
hzn exchange service remove -v -f -o $HZN_ORG_ID -u $HZN_EXCHANGE_USER_AUTH com.github.joewxboy.horizon.edgex_1.0.1
