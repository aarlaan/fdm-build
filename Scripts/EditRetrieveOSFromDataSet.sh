## Script to Edit RetrieveOSInfoFromDataSet XML

# Import Properties file
. /workspace/fdm-config/fdmConfig.properties

newXMLName=${retrieveOSDataSet_env}_RetrieveOSInfoFromDataSet.xml

cd ${workspace_location}
cp ${operationXMLLocation}/RetrieveOSInfoFromDataSet.xml ./${newXMLName}

xmlstarlet ed --inplace -u /DeploymentOperation/@deploymentTreeLocation -v ${deploymentTree} ./${newXMLName}
xmlstarlet ed --inplace -u /DeploymentOperation/RetrieveObjectStoreInfoFromDeployDataSet/@mode -v ${retrieveOSDataSet_mode} ./${newXMLName}
xmlstarlet ed --inplace -u /DeploymentOperation/RetrieveObjectStoreInfoFromDeployDataSet/Environment -v ${retrieveOSDataSet_env} ./${newXMLName}
xmlstarlet ed --inplace -u /DeploymentOperation/RetrieveObjectStoreInfoFromDeployDataSet/DeployDataSet -v ${retrieveOSDataSet_dataSet} ./${newXMLName}

echo Created XML file - ${newXMLName}
