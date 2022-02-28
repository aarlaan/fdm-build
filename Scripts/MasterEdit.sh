# import properties file

. /workspace/fdm-config/fdmSteps.properties

cd /root/FDM/deploy/scripts
chmod 755 ./*

if [ ${create_source_env} == "true" ]
then
	echo "create_source_env set to true. Editing Create Environment XML"
	./EditCreateEnv.sh source
fi

if [ ${create_target_env} == "true" ]
then
	echo "create_target_env set to true. Editing Create Environment XML"
	./EditCreateEnv.sh target
fi

if [ ${retrieve_source_os_dataset} == "true" ]
then
	echo "retrieve_source_os_dataset set to true. Editing Retrieve OS From DataSet XML"
	./EditRetrieveOSFromDataSet.sh
fi

if [ ${retrieve_source_os_domain} == "true" ]
then
	echo "retrieve_source_os_domain set to true. Editing Retrieve OS From Domain XML"
	./EditRetrieveOSFromDomain.sh
fi

if [ ${retrieve_source_principal_dataset} == "true" ]
then
	echo "retrieve_source_principal_dataset set to true. Editing Retrieve Principal From Dataset XML"
	./EditRetrievePrincipalFromDataSet.sh
fi

if [ ${retrieve_source_principal_domain} == "true" ]
then
	echo "retrieve_source_principal_domain set to true. Editing Retrieve Principal From Domain XML"
	./EditRetrievePrincipalFromDomain.sh
fi

if [ ${retrieve_target_os_dataset} == "true" ]
then
	echo "retrieve_target_os_dataset set to true. Editing Retrieve Principal From dataset XML"
	./EditRetrieveOSFromDataSet.sh
fi

if [ ${retrieve_target_os_domain} == "true" ]
then
	echo "retrieve_target_os_domain set to true. Editing Retrieve OS From Domain XML"
	./EditRetrieveOSFromDomain.sh
fi

if [ ${retrieve_target_principal_dataset} == "true" ]
then
	echo "retrieve_target_principal_dataset set to true. Editing Retrieve Principal From Dataset XML"
	./EditRetrievePrincipalFromDataSet.sh
fi

if [ ${retrieve_target_principal_domain} == "true" ]
then
	echo "retrieve_target_principal_domain set to true. Editing Retrieve Principal From Domain XML"
	./EditRetrievePrincipalFromDomain.sh
fi

if [ ${create_source_destination_pair} == "true" ]
then
	echo "create_source_destination_pair set to true. Editing create source destination pair XML"
	./EditPairConfig.sh
fi

if [ ${pair_map_os_data} == "true" ]
then
	echo "pair_map_os_data set to true. Editing Map OS data XML"
	./EditMapOSData.sh
fi

if [ ${pair_map_principal_data} == "true" ]
then
	echo "pair_map_principal_data set to true. Editing Map Principal data XML"
	./EditMapPrincipalData.sh
fi


if [ ${convert_assets} == "true" ]
then
	echo "convert_assets set to true. Editing Convert Assets XML"
	./EditConvertDataSet.sh
fi

if [ ${analyze_converted_assets} == "true" ]
then
	echo "analyze_converted_assets set to true. Editing Analyze Converted Assets XML"
	./EditAnalyzeDataSet.sh
fi

if [ ${import_converted_assets} == "true" ]
then
	echo "import_converted_assets set to true. Editing Import Converted Assets XML"
	./EditImportDataSet.sh
fi

echo "Edited/Created all Operation XMLs"
