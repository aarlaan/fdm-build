FROM registry.access.redhat.com/ubi8/ubi:8.1

RUN yum -y update
COPY ./xmlstarlet-1.6.1-1.el7.x86_64.rpm /root/
COPY ./input /root/input.txt
RUN chmod 777 /root/input.txt
RUN cd /root
RUN yum --nogpgcheck localinstall /root/xmlstarlet-1.6.1-1.el7.x86_64.rpm < /root/input.txt

COPY ./FDM /root/FDM/
COPY ./OperationXMLs /root/FDM/deploy/OperationXMLs
COPY ./Scripts /root/FDM/deploy/scripts

WORKDIR /root/FDM/deploy

ENTRYPOINT ["/bin/bash"]
