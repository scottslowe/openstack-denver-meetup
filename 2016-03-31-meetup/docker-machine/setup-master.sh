#!/bin/bash
# This script relies upon the following environment variables:
# OS_AUTH_URL = Specifies the URL for authentication
# OS_USERNAME = Specifies the username for authentication
# OS_PASSWORD = Specifies the password for authentication
# OS_TENANT_NAME = Specifies the name of the tenant Docker Machine will use

# Define some values used later
OS_IMAGE_ID="eed0ae16-948a-4930-97ab-f7ba128385a8"
OS_NETWORK_NAME="lab-net-5"
OS_SSH_USER="ubuntu"
OS_FLOATINGIP_POOL="ext-net-5"
SWARM_TOKEN="4b923bdad5cd82127975936e2c846537"

# Create the Swarm master instance
docker-machine create -d openstack \
--openstack-flavor-id 3 \
--openstack-image-id $OS_IMAGE_ID \
--openstack-net-name $OS_NETWORK_NAME \
--openstack-floatingip-pool $OS_FLOATINGIP_POOL \
--openstack-ssh-user $OS_SSH_USER \
--openstack-sec-groups docker,basic-services \
--swarm \
--swarm-master \
--swarm-discovery token://$SWARM_TOKEN \
master
