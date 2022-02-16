#!/bin/bash

#Primero creamos un proyecto para la practica final
echo "Creando proyecto para la practica final..."
openstack project create --description "Proyecto para el despliegue del escenario de la practica final de CNVR" practica_final_cnvr
echo "Proyecto practica_final_cnvr creado"

#Creamos el usuario pfinal_user que desplegara el escenario
echo "Creando usuario pfinal_user..."
openstack user create --project practica_final_cnvr --password cnvr --description "Usuario para el despliegue de la practica final de CNVR" pfinal_user
echo "Usuario creado"
#Asignamos el rol heat_stack_owner
echo "Asignando roles..."
openstack role add --user pfinal_user --project practica_final_cnvr heat_stack_owner
echo "Roles asignados"

