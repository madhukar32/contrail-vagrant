#!/bin/bash
function change_directory() {
	cd $1
}

set -x

sudo DEBIAN_FRONTEND=noninteractive cp /home/vagrant/repo/contrail-install-packages_3.1.0.0-25~mitaka_all.deb /tmp/
sudo DEBIAN_FRONTEND=noninteractive dpkg -i /tmp/contrail-install-packages_3.1.0.0-25~mitaka_all.deb
change_directory /opt/contrail/contrail_packages
sudo DEBIAN_FRONTEND=noninteractive ./setup.sh && sudo DEBIAN_FRONTEND=noninteractive apt-get -y -f install
change_directory /opt/contrail/utils
sudo DEBIAN_FRONTEND=noninteractive cp /home/vagrant/testbed.py fabfile/testbeds/
sudo DEBIAN_FRONTEND=noninteractive fab install_pkg_all:/tmp/contrail-install-packages_3.1.0.0-25~mitaka_all.deb
