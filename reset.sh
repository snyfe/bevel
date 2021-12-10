#!/bin/bash
##############################################################################################
#  Copyright Accenture. All Rights Reserved.
#
#  SPDX-License-Identifier: Apache-2.0
##############################################################################################

set -e

echo "Starting build process..."

echo "Adding env variables..."
export PATH=/root/bin:$PATH

#Path to k8s config file
KUBECONFIG=/home/ksuplico/.kube/config


echo "Running the playbook..."
exec ansible-playbook -vv /home/ksuplico/baf/bevel/platforms/shared/configuration/site.yaml --inventory-file=/home/ksuplico/baf/bevel/platforms/shared/inventory/ -e "@/home/ksuplico/baf/bevel/build/network.yaml" -e 'ansible_python_interpreter=/usr/bin/python3' -e "reset='true'"
