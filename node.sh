#!/bin/bash

yum -y update
yum -y install epel-release
cat <<EOF >> /etc/hosts
10.1.2.11   ansible_controller
10.1.2.12   node1
10.1.2.13   node2
10.1.2.14   node3
10.1.2.15   node4
EOF