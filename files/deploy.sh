#!/bin/bash
date
source ~/stackrc
#for i in controller compute1 compute2; do openstack baremetal node power off $i; sleep 1; done

time openstack overcloud deploy \
  --templates /usr/share/openstack-tripleo-heat-templates \
  -n /home/stack/templates/network_data.yaml \
  -r /home/stack/templates/roles_data.yaml \
  -e /home/stack/templates/node_data.yaml \
  -e /home/stack/containers-prepare-parameter.yaml \
  -e /usr/share/openstack-tripleo-heat-templates/environments/network-isolation.yaml \
  -e /usr/share/openstack-tripleo-heat-templates/environments/network-environment.yaml \
  -e /home/stack/templates/network-environment.yaml \
  -e /usr/share/openstack-tripleo-heat-templates/environments/disable-telemetry.yaml

