. /workspace/fdm-config/fdmConfig.properties

if [ $1 = "true" ]
then
	cp -R /root/FDM/deploy/P8DeploymentData ${deploymentTree}
	cd ${deploymentTree}
	chmod -R 755 ./*
	echo Deployment Tree created at - ${deploymentTree}
fi

