# Purpose and Goals for the OpenStack Denver meetup group

This document describes the overall goals for the OpenStack Denver meetup group.

## Purpose of the Group

The overall purpose of this group is to create skilled OpenStack cloud engineers and architects by educating users on how to install, configure, troubleshoot, and operate OpenStack environments.

## Current Goal of the Group

The current goal the group is working toward is establishing a test implementation of OpenStack on attendees' laptops. This will be accomplished by leveraging the following tools:

* We will use Vagrant to help with VM provisioning and management.
* Attendees may choose the virtualization back-end to use (VirtualBox, VMware Fusion, or VMware Workstation).
* Ubuntu 14.04 LTS will be the Linux distribution on which the group will focus.
* OpenStack Juno will be the target release the group will use.
* The target architecture will leverage 4 VMs: one to act as OpenStack "controller", one to act as a Cinder storage node, one to act as a Neutron network node, and the last one to serve as the Nova compute node (running KVM or QEMU).
* OpenStack Networking with the OVS plugin will be the target configuration.

## Completed Goals

* Attendees have installed Vagrant and the virtualization back-end of choice, and have verified that Vagrant is working properly.

## Future Goals

Future goals of the group include:

* Attendees will build a highly-available controller configuration.
* Attendees will upgrade Juno to Kilo (upon Kilo's availability).
* Attendees will explore multi-hypervisor configurations.
* Attendees will explore multiple Cinder back-ends and associated configuration settings.
* Attendees will explore provisioning OpenStack using a provisioning tool (such as Ansible, Chef, Puppet, or Salt).

## License

This material is licensed under the MIT License.
