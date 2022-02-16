#!/bin/bash

#Borramos usuario y proyecto. Debemos ser admin
#Borramos proyecto
openstack project delete practica_final_cnvr
#Borramos usuario
openstack user delete pfinal_user
