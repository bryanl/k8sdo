#!/bin/sh

set -eo pipefail

MASTER_PUBLIC_IP=$1
MASTER_PRIVATE_IP=$2

/bin/mkdir /opt
/usr/bin/echo -e "MASTER_PUBLIC_IPV4=${MASTER_PUBLIC_IP}\nMASTER_PRIVATE_IPV4=${MASTER_PRIVATE_IP}" >> /etc/environment
/bin/curl -sS -o /opt/kubernetes-1.1.2.tar.gz -L http://192.34.57.153/index.php/s/mhr6PSxmJwvMGAc/download
/bin/tar xzf /opt/kubernetes-1.1.2.tar.gz -C /opt 
/usr/bin/cp /opt/kubernetes-1.1.2/services/minion/* /etc/systemd/system/
cd /etc/systemd/system
/usr/bin/systemctl enable *.service
/usr/bin/systemctl restart docker 
/usr/bin/systemctl restart kube-scheduler 
/usr/bin/systemctl restart kube-proxy 
/usr/bin/systemctl restart kubelet

