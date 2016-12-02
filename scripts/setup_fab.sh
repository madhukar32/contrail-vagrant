#!/bin/bash
function change_directory() {
	cd $1
}

set -x

sudo DEBIAN_FRONTEND=noninteractive cp /home/vagrant/repo/contrail-install-packages_* /tmp/
sudo DEBIAN_FRONTEND=noninteractive dpkg -i /tmp/contrail-install-packages_*
change_directory /opt/contrail/contrail_packages
sudo DEBIAN_FRONTEND=noninteractive ./setup.sh && sudo DEBIAN_FRONTEND=noninteractive apt-get -y -f install

change_directory /opt/contrail/utils
sudo DEBIAN_FRONTEND=noninteractive cp /home/vagrant/testbed.py fabfile/testbeds/

packg_name="$(ls --color=auto -ld /tmp/[contrail-install-packages_]* | grep --color=auto ^- | tr -s ' ' | cut -d' ' -f9 | cut -d"/" -f3)"
install_pkg_all="sudo DEBIAN_FRONTEND=noninteractive fab install_pkg_all:/tmp/$packg_name"

eval $install_pkg_all
