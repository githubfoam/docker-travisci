#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script


# https://github.com/Icinga/icinga-vagrant
echo "=============================Icinga 2 Graphite Grafana Dashing Standalone ============================================================="
echo "========================================================================================="
vagrant plugin install vagrant-libvirt #The vagrant-libvirt plugin is required when using KVM on Linux
vagrant plugin install vagrant-mutate #Convert vagrant boxes to work with different providers


vagrant box add "centos/7" --provider=libvirt

git clone https://github.com/Icinga/icinga-vagrant && cd icinga-vagrant
cd standalone && vagrant up --provider=libvirt

# In case Dashing is not running, restart it manually
vagrant ssh -c "sudo systemctl start dashing-icinga2"

echo "=============================Icinga 2 Graphite Grafana Dashing Standalone ============================================================="

