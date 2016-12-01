#!/bin/bash
set -x

sed -i.bak '/PermitRootLogin without-password/a PermitRootLogin yes' /etc/ssh/sshd_config
sed -e '/PermitRootLogin without-password/ s/^#*/#/' -i /etc/ssh/sshd_config
sudo service ssh restart

