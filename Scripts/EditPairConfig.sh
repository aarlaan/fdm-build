## Script to Edit PairConfig XML

# Import Properties file
. /workspace/fdm-config/fdmConfig.properties

cp -R ${deploymentTree}/Pairs/sample-pair ${deploymentTree}/Pairs/${pairName}

cd ${deploymentTree}/Pairs/${pairName}
chmod 755 ./*

xmlstarlet ed --inplace -u /PairConfig/Source/@name -v ${source_envName} ./PairConfig.xml
xmlstarlet ed --inplace -u /PairConfig/Destination/@name -v ${target_envName} ./PairConfig.xml

echo Edited ${deploymentTree}/Pairs/${pairName}/PairConfig.xml
