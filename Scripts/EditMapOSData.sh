## Script to Edit MapOSData XML

# Import Properties file
. /workspace/fdm-config/fdmConfig.properties

newXMLName=${mapOSData_pairName}_MapOSData.xml

cd ${workspace_location}
cp ${operationXMLLocation}/MapOSData.xml ./${newXMLName}

xmlstarlet ed --inplace -u /DeploymentOperation/@deploymentTreeLocation -v ${deploymentTree} ./${newXMLName}
xmlstarlet ed --inplace -u /DeploymentOperation/MapData/Pair -v ${mapOSData_pairName} ./${newXMLName}

echo Created XML - ${workspace_location}/${newXMLName}