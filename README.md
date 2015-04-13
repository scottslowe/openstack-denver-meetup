# Files for the OpenStack Denver meetup group

This repository contains a variety of files for use with the OpenStack Denver meetup group.

## Instructions

To use the Vagrantfile in this repository, follow these instructions:

1. Edit `Vagrantfile` to specify the virtualization provider you will be using. Uncomment the line specifying the desired provider and make sure the lines for the other providers are commented out.

2. Edit `servers.yml` and change each of the "box:" lines to specify the name of the Vagrant box to use. Make sure you specify the name of a box that is supported for the provider you enabled in `Vagrantfile` (i.e., don't specify a box formatted for VirtualBox if you are using one of the VMware providers).

## License

This material is licensed under the MIT License.
