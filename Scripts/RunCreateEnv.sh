## Script to Run Create Environment XML
## Inputs: envType - Valid values: source, target
# Import Properties file

. /workspace/fdm-config/fdmConfig.properties

if [ "$#" -eq "0" ]
	then
		envType="source"
else
	envType=$1
fi

envName=${envType}_envName
newXMLName=${!envName}_CreateEnv.xml
connPassword=${envType}_userPassword

cd /root/FDM/deploy

chmod 777 ./*

/root/FDM/deploy/DeploymentManager -o ${workspace_location}/${newXMLName} -p "${!connPassword}"

echo Created Environment - ${!envName}
