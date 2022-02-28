## Script to Edit Create Environment XML
## Inputs: envType - Valid values: source, target
# Import Properties file

. /workspace/fdm-config/fdmConfig.properties
#. ./configParameters.properties

if [ "$#" -eq "0" ]
	then
		envType="source"
else
	envType=$1
fi

envName=${envType}_envName
newXMLName=${!envName}_CreateEnv.xml
testConn=${envType}_testConn
storepwd=${envType}_savePassword
connType=${envType}_connType
connServer=${envType}_connServerType
connHost=${envType}_connServerHost
connPort=${envType}_connServerPort
connPath=${envType}_connServerPath
connUser=${envType}_userName


cd ${workspace_location}
cp ${operationXMLLocation}/CreateEnv.xml ./${newXMLName}

xmlstarlet ed --inplace -u /DeploymentOperation/@deploymentTreeLocation -v ${deploymentTree} ./${newXMLName}
xmlstarlet ed --inplace -u /DeploymentOperation/CreateEnvironment/@testConnection -v ${!testConn} ./${newXMLName}
xmlstarlet ed --inplace -u /DeploymentOperation/CreateEnvironment/@storePassword -v ${!storepwd} ./${newXMLName}
xmlstarlet ed --inplace -u /DeploymentOperation/CreateEnvironment/Name -v ${!envName} ./${newXMLName}

if [ -z ${!connType} ]
then
	xmlstarlet ed --inplace -u /DeploymentOperation/CreateEnvironment/Connection/Type -v "" ./${newXMLName}
else
	xmlstarlet ed --inplace -u /DeploymentOperation/CreateEnvironment/Connection/Type -v ${!connType} ./${newXMLName}
fi

if [ -z ${!connServer} ]
then
	xmlstarlet ed --inplace -u /DeploymentOperation/CreateEnvironment/Connection/ApplicationServer -v "" ./${newXMLName}
else
	xmlstarlet ed --inplace -u /DeploymentOperation/CreateEnvironment/Connection/ApplicationServer -v ${!connServer} ./${newXMLName}
fi

if [ -z ${!connHost} ]
then
	xmlstarlet ed --inplace -u /DeploymentOperation/CreateEnvironment/Connection/Server -v "" ./${newXMLName}
else
	xmlstarlet ed --inplace -u /DeploymentOperation/CreateEnvironment/Connection/Server -v ${!connHost} ./${newXMLName}
fi

if [ -z ${!connPort} ]
then
	xmlstarlet ed --inplace -u /DeploymentOperation/CreateEnvironment/Connection/Port -v "" ./${newXMLName}
else
	xmlstarlet ed --inplace -u /DeploymentOperation/CreateEnvironment/Connection/Port -v ${!connPort} ./${newXMLName}
fi

if [ -z ${!connPath} ]
then
	xmlstarlet ed --inplace -u /DeploymentOperation/CreateEnvironment/Connection/Path -v "" ./${newXMLName}
else
	xmlstarlet ed --inplace -u /DeploymentOperation/CreateEnvironment/Connection/Path -v ${!connPath} ./${newXMLName}
fi

if [ -z ${!connUser} ]
then
	xmlstarlet ed --inplace -u /DeploymentOperation/CreateEnvironment/Connection/UserName -v "" ./${newXMLName}
else
	xmlstarlet ed --inplace -u /DeploymentOperation/CreateEnvironment/Connection/UserName -v ${!connUser} ./${newXMLName}
fi

echo Created `pwd`/${!envName}_CreateEnv.xml