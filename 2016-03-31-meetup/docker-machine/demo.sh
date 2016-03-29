#!/bin/bash
# This script relies upon the following environment variables:
# OS_AUTH_URL = Specifies the URL for authentication
# OS_USERNAME = Specifies the username for authentication
# OS_PASSWORD = Specifies the password for authentication
# OS_TENANT_NAME = Specifies the name of the tenant Docker Machine will use

# Define some values used later
OS_IMAGE_ID="some value here"
OS_NETWORK_NAME="some value here"
OS_SSH_USER="ubuntu"
OS_FLOATINGIP_POOL="some value here"
SWARM_TOKEN="some value"

# Create the VM and Swarm master
docker-machine create -d openstack \
--openstack-flavor-id 5 \
--openstack-image-id $OS_IMAGE_ID \
--openstack-net-name $OS_NETWORK_NAME \
--openstack-floatingip-pool $OS_FLOATINGIP_POOL \
--openstack-ssh-user $OS_SSH_USER \
--openstack-sec-groups docker,basic-services \
--swarm \
--swarm-master \
--swarm-discovery token://$SWARM_TOKEN
master

# Create first Swarm node
docker-machine create -d openstack \
--openstack-flavor-id 5 \
--openstack-image-id $OS_IMAGE_ID \
--openstack-net-name $OS_NETWORK_NAME \
--openstack-floatingip-pool $OS_FLOATINGIP_POOL \
--openstack-ssh-user $OS_SSH_USER \
--openstack-sec-groups docker,basic-services \
--swarm \
--swarm-discovery token://$SWARM_TOKEN
node-01

# Create second Swarm node
docker-machine create -d openstack \
--openstack-flavor-id 5 \
--openstack-image-id $OS_IMAGE_ID \
--openstack-net-name $OS_NETWORK_NAME \
--openstack-floatingip-pool $OS_FLOATINGIP_POOL \
--openstack-ssh-user $OS_SSH_USER \
--openstack-sec-groups docker,basic-services \
--swarm \
--swarm-discovery token://$SWARM_TOKEN
node-02

