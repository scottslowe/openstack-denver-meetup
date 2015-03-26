# -*- mode: ruby -*-
# vi: set ft=ruby :

# Specify Vagrant version and Vagrant API version
Vagrant.require_version ">= 1.6.0"
VAGRANTFILE_API_VERSION = "2"

# Require 'yaml' module
require 'yaml'

# Read YAML file with VM details (box, CPU, RAM, IP addresses)
# Be sure to edit servers.yml to provide correct IP addresses
servers = YAML.load_file('servers.yml')

# Create and configure the VMs
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Always use Vagrant's default insecure key
  config.ssh.insert_key = false

  # Iterate through entries in YAML file to create VMs
  servers.each do |servers|
    config.vm.define servers["name"] do |srv|
      # Don't check for box updates
      srv.vm.box_check_update = false
      srv.vm.hostname = servers["name"]
      srv.vm.box = servers["box"]
      # Assign an additional static private network
      srv.vm.network "private_network", ip: servers["mgmt_ip"]
      # Specify default synced folder
      srv.vm.synced_folder ".", "/vagrant"
      # Configure VMs with RAM and CPUs per settings in servers.yml
      # First for Fusion-based VMs
      srv.vm.provider :vmware_fusion do |vmw|
        vmw.vmx["memsize"] = servers["ram"]
        vmw.vmx["numvcpus"] = servers["vcpu"]
      end # srv.vm.provider vmware_fusion
      # Now for VirtualBox-based VMs
      srv.vm.provider :virtualbox do |vb|
        vb.customize ["modifyvm", :id, "--memory", servers["ram"]]
      end # srv.vm.provider virtualbox
    end # config.vm.define
  end # servers.each
end # vagrant.configure