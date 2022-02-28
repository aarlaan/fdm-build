## Script to Edit labels in Environment XML
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
osList=${envType}_objectstore_label_list
pList=${envType}_principal_label_list

osIn=(`echo ${!osList} | tr "," " "`)
pIn=(`echo ${!pList} | tr "," " "`)

cd ${deploymentTree}/Environments/${!envName}

for item in ${osIn[@]}
do
        i=(`echo $item | tr ":" " "`)
        if [ ${#i[@]} == 1 ]
        then
                xmlstarlet ed --inplace -u "/HalfMap/List/Item/@label" -v "${i[0]}" ./HalfMap_ObjectStore.xml
                xmlstarlet ed --inplace -u "/HalfMap/List/Item/Name" -v "docs" ./HalfMap_ObjectStore.xml
                xmlstarlet ed --inplace -u "/HalfMap/List/Item/SymbolicName" -v "docs" ./HalfMap_ObjectStore.xml
        else
                name=${i[0]}
                label=${i[1]}
                xmlstarlet ed --inplace -u "/HalfMap/List/Item[./SymbolicName='$name']/@label" -v "$label" ./HalfMap_ObjectStore.xml
        fi
done


echo Finished adding labels to HalfMap_ObjectStore.xml

for item in ${pIn[@]}
do
	i=(`echo $item | tr ":" " "`)
	name=${i[0]}
	label=${i[1]}
	xmlstarlet ed --inplace -u "/HalfMap/List/Item[./ShortName='$name']/@label" -v "$label" ./HalfMap_Principal.xml
done

echo Finished adding labels to HalfMap_Principal.xml
