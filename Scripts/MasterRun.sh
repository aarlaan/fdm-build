# import properties file

. /workspace/fdm-config/fdmSteps.properties

cd /root/FDM/deploy/scripts
chmod 755 ./*

if [ ${create_source_env} == "true" ]
then
	echo "create_source_env set to true. Executing Create Environment XML"
	./RunCreateEnv.sh source
fi

if [ ${create_target_env} == "true" ]
then
	echo "create_target_env set to true. Executing Create Environment XML"
	./RunCreateEnv.sh target
fi

if [ ${retrieve_source_os_dataset} == "true" ]
then
	echo "retrieve_source_os_dataset set to true. Executing Retrieve OS From DataSet XML"
	./RunRetrieveOSFromDataSet.sh
fi

if [ ${retrieve_source_os_domain} == "true" ]
then
	echo "retrieve_source_os_domain set to true. Executing Retrieve OS From Domain XML"
	./RunRetrieveOSFromDomain.sh
fi

if [ ${retrieve_source_principal_dataset} == "true" ]
then
	echo "retrieve_source_principal_dataset set to true. Executing Retrieve Principal From Dataset XML"
	./RunRetrievePrincipalFromDataSet.sh
fi

if [ ${retrieve_source_principal_domain} == "true" ]
then
	echo "retrieve_source_principal_domain set to true. Executing Retrieve Principal From Domain XML"
	./RunRetrievePrincipalFromDomain.sh
fi

if [ ${retrieve_target_os_dataset} == "true" ]
then
	echo "retrieve_target_os_dataset set to true. Executing Retrieve Principal From dataset XML"
	./RunRetrieveOSFromDataSet.sh
fi

if [ ${retrieve_target_os_domain} == "true" ]
then
	echo "retrieve_target_os_domain set to true. Executing Retrieve OS From Domain XML"
	./RunRetrieveOSFromDomain.sh
fi

if [ ${retrieve_target_principal_dataset} == "true" ]
then
	echo "retrieve_target_principal_dataset set to true. Executing Retrieve Principal From Dataset XML"
	./RunRetrievePrincipalFromDataSet.sh
fi

if [ ${retrieve_target_principal_domain} == "true" ]
then
	echo "retrieve_target_principal_domain set to true. Executing Retrieve Principal From Domain XML"
	./RunRetrievePrincipalFromDomain.sh
fi


if [ ${label_halfmaps} == "true" ]
then
        echo "label_halfmaps set to true. Labelling halfmaps"
        ./EditHalfMapLabels.sh source
        ./EditHalfMapLabels.sh target
fi


if [ ${pair_map_os_data} == "true" ]
then
	echo "pair_map_os_data set to true. Executing Map OS data XML"
	./RunMapOSData.sh
fi

if [ ${pair_map_principal_data} == "true" ]
then
	echo "pair_map_principal_data set to true. Executing Map Principal data XML"
	./RunMapPrincipalData.sh
fi


if [ ${convert_assets} == "true" ]
then
	echo "convert_assets set to true. Executing Convert Assets XML"
	./RunConvertDataSet.sh
fi

if [ ${analyze_converted_assets} == "true" ]
then
	echo "analyze_converted_assets set to true. Executing Analyze Converted Assets XML"
	./RunAnalyzeDataSet.sh
fi

if [ ${import_converted_assets} == "true" ]
then
	echo "import_converted_assets set to true. Executing Import Converted Assets XML"
	./RunImportDataSet.sh
fi

echo "Executed all Operation XMLs.."

