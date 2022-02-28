## Script to Edit RetrieveOSInfoFromDataSet XML

# Import Properties file
. /workspace/fdm-config/fdmConfig.properties

newXMLName=${retrieveOSDomain_env}_RetrieveOSFromDomain.xml

cd /root/FDM/deploy

/root/FDM/deploy/DeploymentManager -o ${workspace_location}/${newXMLName}

echo Retrieved OS Info from Domain for Environment - ${retrieveOSDomain_env}