# Read the pem files from workspace

if [ -d /workspace/fdm-ssl-secrets ]
then
	cd /workspace/fdm-ssl-secrets
	count=`ls | wc -l`
	if [ $count -gt  0 ]
	then
		for f in *.pem
		do
			echo $f
			/root/FDM/ibmjava/jre/bin/keytool -import -file $f -keystore "/root/FDM/ibmjava/jre/lib/security/cacerts" -alias `basename $f .pem` -storepass "changeit" < /root/FDM/deploy/keytoolInput.txt
		done
	fi
fi

