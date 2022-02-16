#!/bin/bash

#Borramos reglas del firewall
echo "Borrando reglas del firewall..."
openstack firewall group unset --egress-firewall-policy --ingress-firewall-policy practica_final_group
openstack firewall group policy delete ingressFirewallPolicy egressFirewallPolicy
openstack firewall group rule delete adminSSH_rule loadBalancerWeb_rule interior_rule
openstack firewall group delete practica_final_group
echo "Reglas firewall eliminadas"

#Borramos el stack
echo "Borrando stack..."
openstack stack delete -y practica_final
echo "Stack borrado"
