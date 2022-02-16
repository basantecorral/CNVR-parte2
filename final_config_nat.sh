#!/bin/bash

#Dado que nos hemos fijado que el nombre de la interfaz de salida necesaria para configurar el nat cambia cada vez que cerramos sesion, se crea este script para configurarlo rapidamente


interfaz=$(ifconfig | grep enp | awk '{print $1}' | sed 's/://')
sudo vnx_config_nat ExtNet $interfaz
echo "Interfaz: " $interfaz
