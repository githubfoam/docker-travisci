#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script

# https://github.com/PowerDNS/pdns/blob/master/pdns/recursordist/README.md
echo "=============================build PowerDNS Recursor============================================================="

# Compiling from git checkout    
git clone https://github.com/PowerDNS/pdns.git
cd pdns/pdns/recursordist/
autoreconf -vi
# ./configure #configure: error: cannot find Boost headers version >= 1.42.0
# make

echo "=============================build PowerDNS Recursor finished============================================================="
