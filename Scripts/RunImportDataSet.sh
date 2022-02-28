## Script to Edit ImportDataSet XML

# Import Properties file
. /workspace/fdm-config/fdmConfig.properties

newXMLName=${import_env}_ImportDataSet.xml

cd /root/FDM/deploy

/root/FDM/deploy/DeploymentManager -o ${workspace_location}/${newXMLName}

echo ImportDataSet Completed for Environment - ${import_env}