## Script to Edit RetrievePrincipalInfoFromDataSet XML

# Import Properties file
. /workspace/fdm-config/fdmConfig.properties

newXMLName=${retrievePrincipalDataSet_env}_RetrievePrincipalFromDataset.xml

cd ${workspace_location}
cp ${operationXMLLocation}/RetrievePrincipalFromDataset.xml ./${newXMLName}

xmlstarlet ed --inplace -u /DeploymentOperation/@deploymentTreeLocation -v ${deploymentTree} ./${newXMLName}
xmlstarlet ed --inplace -u /DeploymentOperation/RetrievePrincipalInfoFromDeployDataSet/@mode -v ${retrievePrincipalDataSet_mode} ./${newXMLName}
xmlstarlet ed --inplace -u /DeploymentOperation/RetrievePrincipalInfoFromDeployDataSet/Environment -v ${retrievePrincipalDataSet_env} ./${newXMLName}
xmlstarlet ed --inplace -u /DeploymentOperation/RetrievePrincipalInfoFromDeployDataSet/DeployDataSet -v ${retrievePrincipalDataSet_dataSet} ./${newXMLName}

echo Created XML - ${workspace_location}/${newXMLName}