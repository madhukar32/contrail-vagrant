#!/bin/bash
function change_directory() {
	cd $1
}
set -x

change_directory /opt/contrail/utils
sudo DEBIAN_FRONTEND=noninteractive fab install_contrail
sudo DEBIAN_FRONTEND=noninteractive fab setup_all:reboot=False
