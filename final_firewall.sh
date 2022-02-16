#!/bin/bash

admin_ip=$(openstack stack output show practica_final admin_ip -f value -c output_value)
loadBalancer_ip=$(openstack stack output show practica_final load_balancer_ip -f value -c output_value)
router_port=$(openstack port list --fixed-ip subnet=subnet1,ip-address=10.1.1.1 -f value -c ID)

# -----CONFIGURACION DE FWaaS, neutron... esta deprecado, se usa openstack firewall
#Regla para permitir SSH en admin (puerto 22)
openstack firewall group rule create --protocol tcp --source-ip-address 0.0.0.0/0 --destination-ip-address $admin_ip --source-port 1:65535 --destination-port 22 --action allow --name adminSSH_rule
#Regla para permitir acceso al puerto 80 del balanceador de carga
openstack firewall group rule create --protocol tcp --source-ip-address 0.0.0.0/0 --destination-ip-address $loadBalancer_ip --source-port 1:65535 --destination-port 80 --action allow --name loadBalancerWeb_rule
#Regla para el acceso desde el interior de la red a cualquier destino
openstack firewall group rule create --protocol any --source-ip-address 10.1.1.0/24 --destination-ip-address 0.0.0.0/0 --action allow --name interior_rule

#Creacion de group policies para trafico entrante (ingress) y saliente (egress) de la red
openstack firewall group policy create --firewall-rule adminSSH_rule ingressFirewallPolicy
openstack firewall group policy set --firewall-rule loadBalancerWeb_rule ingressFirewallPolicy
openstack firewall group policy create --firewall-rule interior_rule egressFirewallPolicy
openstack firewall group create --ingress-firewall-policy ingressFirewallPolicy --egress-firewall-policy egressFirewallPolicy --port $router_port --name practica_final_group
