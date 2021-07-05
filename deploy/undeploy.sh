#!/bin/bash

Namespace=$1
DeployType=$2
ProjectID=$4
export ServiceName=$3
export ServiceVersion=0.1.0

export Arch="$(cut -d'/' -f2 <<<"$Platform")"

export HZN_EXCHANGE_URL=$TargetServer
export HZN_ORG_ID="$(cut -d'@' -f2 <<<"$Username")"
export HZN_EXCHANGE_USER_AUTH="$(cut -d'@' -f1 <<<"$Username")"

echo "HZN_EXCHANGE_URL="$HZN_EXCHANGE_URL
echo "HZN_ORG_ID="$HZN_ORG_ID
echo "HZN_EXCHANGE_USER_AUTH="$HZN_EXCHANGE_USER_AUTH

echo "Undeploy Through Open Horizon Exchange !!"
hzn unregister -o $HZN_ORG_ID -u $HZN_EXCHANGE_USER_AUTH -f

# Remove policy
hzn exchange deployment removepolicy  -v -f -o $HZN_ORG_ID -u $HZN_EXCHANGE_USER_AUTH "policy-"$ServiceName"_"$ServiceVersion

# Remove Service
hzn exchange service remove -v -f -o $HZN_ORG_ID -u $HZN_EXCHANGE_USER_AUTH $ServiceName"_"$ServiceVersion"_"$Arch

hzn exchange service list -o $HZN_ORG_ID -u $HZN_EXCHANGE_USER_AUTH
hzn exchange deployment listpolicy -o $HZN_ORG_ID -u $HZN_EXCHANGE_USER_AUTH
