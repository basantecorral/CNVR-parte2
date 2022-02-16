#!/bin/bash

#Despliega el stack que crea el escenario con el servicio de autoescalado
echo "Desplegando escenario..."
openstack stack create -t stacks/practica_final_autoscaling.yaml practica_final
echo "Escenario desplegado"
