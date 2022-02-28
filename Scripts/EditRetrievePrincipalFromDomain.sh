## Script to Edit RetrievePrincipalFromDomain XML

# Import Properties file
. /workspace/fdm-config/fdmConfig.properties

newXMLName=${retrievePrincipalDomain_env}_RetrievePrincipalFromDomain.xml

cd ${workspace_location}
cp ${operationXMLLocation}/RetrievePrincipalFromDomain.xml ./${newXMLName}

xmlstarlet ed --inplace -u /DeploymentOperation/@deploymentTreeLocation -v ${deploymentTree} ./${newXMLName}
xmlstarlet ed --inplace -u /DeploymentOperation/RetrievePrincipalInfoFromDomain/@mode -v ${retrievePrincipalDomain_mode} ./${newXMLName}
xmlstarlet ed --inplace -u /DeploymentOperation/RetrievePrincipalInfoFromDomain/Environment -v ${retrievePrincipalDomain_env} ./${newXMLName}
xmlstarlet ed --inplace -u /DeploymentOperation/RetrievePrincipalInfoFromDomain/LDAPDataSource/Realms/Realm -v ${retrievePrincipalDomain_ldapRealm} ./${newXMLName}

echo Created XML - ${workspace_location}/${newXMLName}