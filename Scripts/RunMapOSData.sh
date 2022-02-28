## Script to Edit MapOSData XML

# Import Properties file
. /workspace/fdm-config/fdmConfig.properties

newXMLName=${mapOSData_pairName}_MapOSData.xml

cd /root/FDM/deploy

/root/FDM/deploy/DeploymentManager -o ${workspace_location}/${newXMLName}

echo Mapped OS DataSet for Pair - ${mapOSData_pairName}