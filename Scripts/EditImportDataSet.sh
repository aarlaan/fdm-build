## Script to Edit ImportDataSet XML

# Import Properties file
. /workspace/fdm-config/fdmConfig.properties

newXMLName=${import_env}_ImportDataSet.xml

cd ${workspace_location}
cp ${operationXMLLocation}/ImportDataSet.xml ./${newXMLName}

xmlstarlet ed --inplace -u /DeploymentOperation/@deploymentTreeLocation -v ${deploymentTree} ./${newXMLName}
xmlstarlet ed --inplace -u /DeploymentOperation/ImportDeployDataSet/UpdateOption -v ${import_updateOption} ./${newXMLName}
xmlstarlet ed --inplace -u /DeploymentOperation/ImportDeployDataSet/DeleteCreatedFilesOnError/@value -v ${import_deleteOnError} ./${newXMLName}
xmlstarlet ed --inplace -u /DeploymentOperation/ImportDeployDataSet/CreateOption -v ${import_createOption} ./${newXMLName}
xmlstarlet ed --inplace -u /DeploymentOperation/ImportDeployDataSet/Environment -v ${import_env} ./${newXMLName}
xmlstarlet ed --inplace -u /DeploymentOperation/ImportDeployDataSet/ImportOwner/@value -v ${import_importOwner} ./${newXMLName}
xmlstarlet ed --inplace -u /DeploymentOperation/ImportDeployDataSet/DeployDataSet -v ${import_dataSet} ./${newXMLName}


echo Created XML - ${workspace_location}/${newXMLName}