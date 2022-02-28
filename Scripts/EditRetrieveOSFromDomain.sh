## Script to Edit RetrieveOSFromDomain XML

# Import Properties file
. /workspace/fdm-config/fdmConfig.properties

newXMLName=${retrieveOSDomain_env}_RetrieveOSFromDomain.xml

cd ${workspace_location}
cp ${operationXMLLocation}/RetrieveOSFromDomain.xml ./${newXMLName}

xmlstarlet ed --inplace -u /DeploymentOperation/@deploymentTreeLocation -v ${deploymentTree} ./${newXMLName}
xmlstarlet ed --inplace -u /DeploymentOperation/RetrieveObjectStoreInfoFromDomain/@mode -v ${retrieveOSDomain_mode} ./${newXMLName}
xmlstarlet ed --inplace -u /DeploymentOperation/RetrieveObjectStoreInfoFromDomain/Environment -v ${retrieveOSDomain_env} ./${newXMLName}

echo Created XML - ${newXMLName}
