# Contrail Cloud provisioning using vagrant

This repo contains tools to install an all in one contrail cloud on a vagrant provisioned virtual machine, the provider of the virtual machine will be virtualbox in this repo. Enhancement will made to this repo to include multi-vm setup.

## Prerequisites and Limitations
* Host should have minimum of 4 cpus, 16GB of RAM and 16GB of storage to play around
* As of today we have only ubuntu vagrant box, hence will only be able to provision contrail ubuntu packages

## Installation Overview
1. ##### Install Virtualbox
    *   [For ubuntu guest OS](https://help.ubuntu.com/community/VirtualBox/Installation)
    *   [For centos guest OS](https://wiki.centos.org/HowTos/Virtualization/VirtualBox)

2. ##### Install Vagrant
    Download the appropriate [package](https://www.vagrantup.com/downloads.html) for your opertaing system and install vagrant
    _Vagrant plugins to be installed_
    `$ vagrant plugin install vagrant-reload`

## Steps to provision contrail using vagrant
1. ##### Adding vagrant box
   * `$ vagrant box add contrail/ubuntu-14.04.4 ubuntu-14.04-amd64-contrail.box`

2. ##### Clone the contrail-vagrant repository
   * `$ git clone https://github.com/madhukar32/contrail-vagrant.git`
   * `$ cd contrail-vagrant`

3. ##### Download the appropriate Contrail ubuntu install packages file from [Juniper Download page](http://www.juniper.net/support/downloads/?p=contrail#sw)

4. ##### Move your ubuntu contrail packages to repo folder
   * `$ cp /path/to/file/contrail-install-packages-1.xx-xxx~openstack_version_all.deb repo/`

5. ##### Edit Vagrantfile and testbed.py files
    * Edit testbed.py file to update your storage memory field as per your hosts availability **(min 16GB)**
        `$ vi testbed.py`
        ````bash
            minimum_diskGB = 16
        ````
    * Edit Vagrantfile to update your vcpus and ram needed for the guest vm
        `$ vi Vagrantfile`
        ```ruby
                config.vm.provider "virtualbox" do |vb|
                ## Customize the amount of memory on the VM:
                        vb.memory = "16384"
                        vb.cpus = 8
                end
        ```

6. ##### Bring up the contrail cloud by single command
        `vagrant up`
