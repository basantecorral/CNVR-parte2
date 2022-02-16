#!/bin/bash

#Este script no influye en la realizacion de la practica, simplemente elimina openstack

openstack image delete bbdd_cnvr
cd /mnt/tmp/openstack_lab-stein_4n_classic_ovs-v06
sudo vnx -f openstack_lab.xml -v --destroy
