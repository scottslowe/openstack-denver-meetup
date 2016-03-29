#!/bin/bash
# This script relies upon the following environment variables:
# OS_AUTH_URL = Specifies the URL for authentication
# OS_USERNAME = Specifies the username for authentication
# OS_PASSWORD = Specifies the password for authentication
# OS_TENANT_NAME = Specifies the name of the tenant Docker Machine will use

# Define some values used later
OS_IMAGE_ID="be12ea81-d586-414f-be1d-3004796a5fc1"
OS_NETWORK_NAME="test-05"
OS_SSH_USER="ubuntu"
OS_FLOATINGIP_POOL="ext-net-5"
SWARM_TOKEN="some value"

# Create the VM and Swarm master
docker-machine create -d openstack \
--openstack-flavor-id 3 \
--openstack-image-id $OS_IMAGE_ID \
--openstack-net-name $OS_NETWORK_NAME \
--openstack-floatingip-pool $OS_FLOATINGIP_POOL \
--openstack-ssh-user $OS_SSH_USER \
--openstack-sec-groups docker,basic-services \
master

# Create first Swarm node
docker-machine create -d openstack \
--openstack-flavor-id 3 \
--openstack-image-id $OS_IMAGE_ID \
--openstack-net-name $OS_NETWORK_NAME \
--openstack-floatingip-pool $OS_FLOATINGIP_POOL \
--openstack-ssh-user $OS_SSH_USER \
--openstack-sec-groups docker,basic-services \
node-01

# Create second Swarm node
docker-machine create -d openstack \
--openstack-flavor-id 3 \
--openstack-image-id $OS_IMAGE_ID \
--openstack-net-name $OS_NETWORK_NAME \
--openstack-floatingip-pool $OS_FLOATINGIP_POOL \
--openstack-ssh-user $OS_SSH_USER \
--openstack-sec-groups docker,basic-services \
node-02
