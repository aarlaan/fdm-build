## Script to Edit RetrieveOSInfoFromDataSet XML

# Import Properties file
. /workspace/fdm-config/fdmConfig.properties

newXMLName=${retrieveOSDataSet_env}_RetrieveOSInfoFromDataSet.xml

cd /root/FDM/deploy

/root/FDM/deploy/DeploymentManager -o ${workspace_location}/${newXMLName}

echo Retrieved OS Info from DataSet for Environment - ${retrieveOSDataSet_env}