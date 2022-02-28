## Script to Edit AnalyzeDataSet XML

# Import Properties file
. /workspace/fdm-config/fdmConfig.properties

newXMLName=${analyze_pairName}_AnalyzeDataSet.xml

cd /root/FDM/deploy

/root/FDM/deploy/DeploymentManager -o ${workspace_location}/${newXMLName}

echo Analyzed DataSet for Pair - ${analyze_pairName}e}