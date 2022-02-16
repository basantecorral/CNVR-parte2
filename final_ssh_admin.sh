#!/bin/bash

#Script para habilitar o deshabilitar el ssh a admin

PARAMETERS="
Parameters: e, d\n
  being:\n
    e: Enable ssh access\n
    d: Disable ssh access
"

if [ "$1" = "d" ]
then openstack firewall group rule set adminSSH_rule --disable
     echo "SSH a Admin deshabilitado"
elif [ "$1" = "e" ]
then openstack firewall group rule set adminSSH_rule --enable
     echo "SSH a Admin habilitado"
elif [ "$1" = "help" ]
then echo -e $PARAMETERS
else
echo -e "Wrong Parameters!\n $PARAMETERS"
fi

