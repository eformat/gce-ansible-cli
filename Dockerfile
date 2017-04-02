from rhel7

RUN echo 'domain local'  > /etc/resolv.conf
RUN echo 'nameserver ns-cloud-e1.googledomains.com.;ns-cloud-e2.googledomains.com.;ns-cloud-e3.googledomains.com.;ns-cloud-e4.googledomains.com' >> /etc/resolv.conf
RUN echo 'nameserver 192.168.65.1' >> /etc/resolv.conf
RUN subscription-manager register --username= --password=
RUN subscription-manager attach --pool=8a85f981544efea201544fba3da243dd
RUN subscription-manager repos --disable="*"
RUN subscription-manager repos --enable="rhel-7-server-rpms" --enable="rhel-7-server-extras-rpms" --enable="rhel-7-server-ose-3.4-rpms" 
RUN yum -y install wget git net-tools bind-utils iptables-services bridge-utils bash-completion vim mlocate 
RUN yum -y install curl python which tar qemu-img openssl gettext git ansible python-libcloud
RUN echo '#!/bin/bash' > /root/gcp-init.sh
RUN echo 'curl https://sdk.cloud.google.com | bash' >> /root/gcp-init.sh
RUN echo 'exec -l $SHELL ' >> /root/gcp-init.sh
RUN echo '/root/google-cloud-sdk/bin/gcloud components install beta ' >> /root/gcp-init.sh
RUN echo '/root/google-cloud-sdk/bin/gcloud init ' >> /root/gcp-init.sh
RUN chmod +x /root/gcp-init.sh
RUN git clone https://github.com/openshift/openshift-ansible-contrib.git
ADD config.sh /openshift-ansible-contrib/reference-architecture/gce-cli/config.sh
RUN curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
RUN python get-pip.py
RUN pip install apache-libcloud==0.20.1
RUN mkdir /root/Downloads
ADD rhel-guest-image-7.3-35.x86_64.qcow2 /root/Downloads/rhel-guest-image-7.3-35.x86_64.qcow2
