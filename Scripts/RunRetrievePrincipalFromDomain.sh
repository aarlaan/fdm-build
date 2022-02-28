## Script to Edit RetrievePrincipalInfoFromDataSet XML

# Import Properties file
. /workspace/fdm-config/fdmConfig.properties

newXMLName=${retrievePrincipalDomain_env}_RetrievePrincipalFromDomain.xml

cd /root/FDM/deploy

/root/FDM/deploy/DeploymentManager -o ${workspace_location}/${newXMLName}

echo Retrieved Principal Info from Domain for Environment - ${retrievePrincipalDomain_env}