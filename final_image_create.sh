#!/bin/bash

#Este script importa la imagen de la bbdd a openstack. Necesario ser admin

openstack image create --disk-format qcow2 --public --file ./images/bbdd_cnvr.qcow2 bbdd_cnvr

