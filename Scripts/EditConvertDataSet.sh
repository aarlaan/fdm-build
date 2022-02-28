## Script to Edit ConvertDataSet XML

# Import Properties file
. /workspace/fdm-config/fdmConfig.properties

newXMLName=${convert_pairName}_ConvertDataSet.xml

cd ${workspace_location}
cp ${operationXMLLocation}/ConvertDataSet.xml ./${newXMLName}

xmlstarlet ed --inplace -u /DeploymentOperation/@deploymentTreeLocation -v ${deploymentTree} ./${newXMLName}
xmlstarlet ed --inplace -u /DeploymentOperation/ConvertDeployDataSet/@deleteDestinationFilesOnError -v ${convert_deleteOnError} ./${newXMLName}
xmlstarlet ed --inplace -u /DeploymentOperation/ConvertDeployDataSet/Pair -v ${convert_pairName} ./${newXMLName}
xmlstarlet ed --inplace -u /DeploymentOperation/ConvertDeployDataSet/SourceDeployDataSet -v ${convert_sourceDataSet} ./${newXMLName}
xmlstarlet ed --inplace -u /DeploymentOperation/ConvertDeployDataSet/ConvertedDeployDataSet -v ${convert_convertedDataSet} ./${newXMLName}

echo Created XML file - ${workspace_location}/${newXMLName}