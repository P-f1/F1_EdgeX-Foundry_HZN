#!/bin/bash

Namespace=$1
DeployType=$2
ProjectID=$4
export ServiceName=$3
export ServiceVersion=0.1.0

export Arch="$(cut -d'/' -f2 <<<"$Platform")"

export Artifacts=/home/steven/loss-detection-app

export HZN_EXCHANGE_URL=$TargetServer
export HZN_ORG_ID="$(cut -d'@' -f2 <<<"$Username")"
export HZN_EXCHANGE_USER_AUTH="$(cut -d'@' -f1 <<<"$Username")"

echo "HZN_EXCHANGE_URL="$HZN_EXCHANGE_URL
echo "HZN_ORG_ID="$HZN_ORG_ID
echo "HZN_EXCHANGE_USER_AUTH="$HZN_EXCHANGE_USER_AUTH

cd ../artifacts/plugins/python

chmod +x build-descriptor.py
python3 ./build-descriptor.py "open-horizon.transform" "../../docker-compose" "*.yml" "open-horizon"

cd ../../open-horizon/

echo "Deploy Through OpenHorizon Exchange !!"

# Publish the service and pattern
hzn exchange service publish -P -o $HZN_ORG_ID -u $HZN_EXCHANGE_USER_AUTH -f service.json
#hzn exchange pattern publish -o $HZN_ORG_ID -u $HZN_EXCHANGE_USER_AUTH -f pattern.json

# Publish the deployment policy
hzn exchange deployment addpolicy -o $HZN_ORG_ID -u $HZN_EXCHANGE_USER_AUTH -f deployment.policy.json "policy-"$ServiceName"_"$ServiceVersion

hzn exchange service list -o $HZN_ORG_ID -u $HZN_EXCHANGE_USER_AUTH
hzn exchange deployment listpolicy -o $HZN_ORG_ID -u $HZN_EXCHANGE_USER_AUTH
