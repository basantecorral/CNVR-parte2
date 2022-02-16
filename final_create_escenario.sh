#!/bin/bash

#Despliega el stack que crea el escenario
echo "Desplegando escenario..."
openstack stack create -t stacks/practica_final.yaml practica_final
echo "Escenario desplegado"
