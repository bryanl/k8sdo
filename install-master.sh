#!/bin/sh

set -eo pipefail

/bin/mkdir /opt
/bin/curl -sS -o /opt/kubernetes-1.1.2.tar.gz -L http://192.34.57.153/index.php/s/mhr6PSxmJwvMGAc/download
/bin/tar xzf /opt/kubernetes-1.1.2.tar.gz -C /opt
/usr/bin/cp /opt/kubernetes-1.1.2/services/master/* /etc/systemd/system/
cd /etc/systemd/system 
/usr/bin/systemctl *.service
/usr/bin/systemctl restart docker
/usr/bin/systemctl restart kube-apiserver 
/usr/bin/systemctl restart kube-controller-manager 
/usr/bin/systemctl restart kube-scheduler 
/usr/bin/systemctl restart kube-proxy 
/usr/bin/systemctl restart kubelet
