# Contrail Cloud provisioning using vagrant

This repo contains tools to install an all in one contrail cloud on a vagrant provisioned virtual machine, the provider of the virtual machine will be virtualbox in this repo. Enhancement will made to this repo to include multi-vm setup.

## Prerequisites and Limitations
* Host should have minimum of 4 cpus, 16GB of RAM and 16GB of storage to play around 
* As of today we have only ubuntu vagrant box, hence will only be able to provision contrail ubuntu packages 

## Installation Overview

1. #### [Install Vagrant](https://www.vagrantup.com/downloads.html)
   _Download the appropriate package for your opertaing system and install vagrant_
   Vagrant plugins to be installed
	* `$ vagrant plugin install vagrant-reload`

2. #### Adding vagrant box 
   * `$ vagrant box add contrail/ubuntu-14.04.4 ubuntu-14.04-amd64-contrail.box`

3. #### Clone the contrail-vagrant repository
   * `$ git clone https://github.com/madhukar32/contrail-vagrant.git`
   * `$ cd contrail-vagrant`

4. #### Download the appropriate Contrail ubuntu install packages file from [Juniper Download page](http://www.juniper.net/support/downloads/?p=contrail#sw)

5. #### Move your ubuntu contrail packages to repo folder
   * `$ cp /path/to/file/contrail-install-packages-1.xx-xxx~openstack_version_all.deb repo/`

6. #### Edit Vagrantfile and testbed.py files
	* Edit testbed.py file to update your storage memory field as per your hosts availability **(min 16GB)**
			`minimum_diskGB = 16` 
	* Edit Vagrantfile to update your vcpus and ram needed for the guest vm
	```ruby
		config.vm.provider "virtualbox" do |vb|
		## Customize the amount of memory on the VM:
			vb.memory = "16384"
			vb.cpus = 8
		end
	```

## Bring up the contrail cloud by single command
	`vagrant up`

