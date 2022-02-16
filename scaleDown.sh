#!/bin/bash

curl -XPOST -i $(openstack stack output show practica_final scaledown_url -f value -c output_value)
