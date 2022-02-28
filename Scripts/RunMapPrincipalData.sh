## Script to Edit MapPrincipalData XML

# Import Properties file
. /workspace/fdm-config/fdmConfig.properties

newXMLName=${mapPrincipalData_pairName}_MapPrincipalData.xml

cd /root/FDM/deploy

/root/FDM/deploy/DeploymentManager -o ${workspace_location}/${newXMLName}

echo Mapped Principal Data for Pair - ${mapPrincipalData_pairName}
