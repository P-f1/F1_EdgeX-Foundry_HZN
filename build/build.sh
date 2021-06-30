#!/bin/bash

ProjectID=$1 
ServiceName=$2 
BuildFolder=$3 

echo "ProjectID = "$ProjectID
echo "ServiceName = "$ServiceName
echo "BuildFolder = "$BuildFolder
echo "EXT_HOME_DIR = " $EXT_HOME_DIR
echo "FRAMEWORK = " $FRAMEWORK

# Clone the ORRA repository and navigate to the SDO-OH-EXF demo folder
git clone https://github.com/edgexfoundry-holding/orra.git ../artifacts/orra

cd ../artifacts/orra/demos/SDO-OH-EXF-dev-simple

# Create the temporary and configuration folders, copy the EdgeX Foundry service configuration patterns to their expected location
mkdir -p /var/run/edgex/logs
mkdir -p /var/run/edgex/data
mkdir -p /var/run/edgex/consul/data
mkdir -p /var/run/edgex/consul/config
mkdir -p /root/res
chmod -R a+rwx /var/run/edgex
chmod -R a+rwx /root/res
cp res/* /root/res
