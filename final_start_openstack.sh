#!/bin/bash

#Este script no influye en la realizacion de la practica, simplemente inicia el servicio de openstack con todo lo necesario
/lab/cnvr/bin/get-openstack-tutorial.sh
cd /mnt/tmp/openstack_lab-stein_4n_classic_ovs-v06
sed -i '34d' openstack_lab.xml 
sudo vnx -f openstack_lab.xml -v --create
sudo vnx -f openstack_lab.xml -v -x start-all
sudo vnx -f openstack_lab.xml -v -x load-img
