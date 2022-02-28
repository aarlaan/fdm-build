## Script to Edit MapPrincipalData XML

# Import Properties file
. /workspace/fdm-config/fdmConfig.properties

newXMLName=${mapPrincipalData_pairName}_MapPrincipalData.xml

cd ${workspace_location}
cp ${operationXMLLocation}/MapPrincipalData.xml ./${newXMLName}

xmlstarlet ed --inplace -u /DeploymentOperation/@deploymentTreeLocation -v ${deploymentTree} ./${newXMLName}
xmlstarlet ed --inplace -u /DeploymentOperation/MapData/Pair -v ${mapPrincipalData_pairName} ./${newXMLName}

echo Created XML - ${workspace_location}/${newXMLName}