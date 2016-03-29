# Standing up a Docker Swarm Cluster on OpenStack

## Obtain a Discovery Token

Before starting, you'll need to obtain a _discovery token_. The easiest way to do this is to use Docker Hub to provide a token:

1. Stand up a local Docker host using Docker Machine and your driver of choice (this example uses VMware Fusion):

        docker-machine create -d vmwarefusion token

2. Make this local Docker host your active Docker host:

        eval $(docker-machine env token)

3. Obtain the Swarm discovery token with the following command:

        docker run swarm create

    Make note of the output of this command, as it will be the Swarm discovery token you'll need later.

Once you have the Swarm discovery token, you're ready to edit the shell scripts with information specific to your environment.

## Editing the Setup Scripts

1. Using the tool of your choice (CLI, Horizon dashboard, or other), obtain the following pieces of information:
    - The ID of the Glance image you want the scripts to use
    - The name of the Neutron network to which the VMs should be attached
    - The SSH username Docker Machine should use (will depend on the image)
    - The floating IP pool from which Docker Machine should allocate IP addresses

2. Edit `setup-master.sh`, `setup-node1.sh`, and `setup-node2.sh` to use the values collected in the previous step. You'll also want to include the Swarm discovery token obtained earlier.

You're now ready to run the scripts and stand up a Docker Swarm cluster on OpenStack.

## Running the Setup Scripts

1. Source in your OpenStack credentials so that the `OS_AUTH_URL`, `OS_USERNAME`, `OS_PASSWORD`, and `OS_TENANT_NAME` environment variables are correctly populated.

2. Run `setup-master.sh` to create the Swarm master node.

3. Run `setup-node1.sh` to create the first Swarm node.

4. Run `setup-node2.sh` to create the second Swarm node.

5. Make the Swarm cluster your active Docker host:

        eval $(docker-machine env --swarm master)

6. Enjoy working with the Swarm cluster!
