## Script to Edit RetrievePrincipalFromDataset XML

# Import Properties file
. /workspace/fdm-config/fdmConfig.properties

newXMLName=${retrievePrincipalDataSet_env}_RetrievePrincipalFromDataset.xml

cd /root/FDM/deploy

/root/FDM/deploy/DeploymentManager -o ${workspace_location}/${newXMLName}

echo Retrieved Principal Info from DataSet for Environment - ${retrievePrincipalDataSet_env}