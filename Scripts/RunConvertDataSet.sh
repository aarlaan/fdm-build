## Script to Edit ConvertDataSet XML

# Import Properties file
. /workspace/fdm-config/fdmConfig.properties

newXMLName=${convert_pairName}_ConvertDataSet.xml

cd /root/FDM/deploy

/root/FDM/deploy/DeploymentManager -o ${workspace_location}/${newXMLName}

echo Converted DataSet for Pair - ${convert_pairName}