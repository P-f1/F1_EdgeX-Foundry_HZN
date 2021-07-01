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

cd ../artifacts/orra/demos/SDO-OH-EXF-dev-simple

echo "Deploy Through OpenHorizon Exchange !!"

# Publish the service and pattern
hzn exchange service publish -P -o $HZN_ORG_ID -u $HZN_EXCHANGE_USER_AUTH -f configuration/service.json
#hzn exchange pattern publish -o $HZN_ORG_ID -u $HZN_EXCHANGE_USER_AUTH -f configuration/pattern.json

# Publish the deployment policy
hzn exchange deployment addpolicy -o $HZN_ORG_ID -u $HZN_EXCHANGE_USER_AUTH -f configuration/deployment.policy.json myorg/policy-com.github.joewxboy.horizon.edgex_1.0.1_amd64
