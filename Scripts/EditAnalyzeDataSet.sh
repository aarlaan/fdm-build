## Script to Edit AnalyzeDataSet XML

# Import Properties file
. /workspace/fdm-config/fdmConfig.properties

newXMLName=${analyze_pairName}_AnalyzeDataSet.xml

cd ${workspace_location}
cp ${operationXMLLocation}/AnalyzeDataSet.xml ./${newXMLName}

xmlstarlet ed --inplace -u /DeploymentOperation/@deploymentTreeLocation -v ${deploymentTree} ./${newXMLName}
xmlstarlet ed --inplace -u /DeploymentOperation/AnalyzeDeployDataSet/@analysisFailuresLimit -v ${analyze_FailLimit} ./${newXMLName}
xmlstarlet ed --inplace -u /DeploymentOperation/AnalyzeDeployDataSet/@deleteAnalysisResultsFileOnError -v ${analyze_deleteOnError} ./${newXMLName}
xmlstarlet ed --inplace -u /DeploymentOperation/AnalyzeDeployDataSet/Pair -v ${analyze_pairName} ./${newXMLName}
xmlstarlet ed --inplace -u /DeploymentOperation/AnalyzeDeployDataSet/DeployDataSet -v ${analyze_dataSet} ./${newXMLName}
xmlstarlet ed --inplace -u /DeploymentOperation/AnalyzeDeployDataSet/ValidationOutput/AnalysisReportFileName -v ${analyze_analysisFileName} ./${newXMLName}

echo Created XML - ${workspace_location}/${newXMLName}}