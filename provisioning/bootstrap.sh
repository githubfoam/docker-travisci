#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script

echo "===================================================================================="
                          hostnamectl status
echo "===================================================================================="
echo "         \   ^__^                                                                  "
echo "          \  (oo)\_______                                                          "
echo "             (__)\       )\/\                                                      "
echo "                 ||----w |                                                         "
echo "                 ||     ||                                                         "
echo "========================================================================================="
echo "==========================Compiling PowerDNS Recursor==============================================================="

# https://github.com/PowerDNS/pdns/tree/master/pdns/recursordist
# As for dependencies, Boost (http://boost.org/), OpenSSL (https://openssl.org/), and Lua (https://www.lua.org/) are required.
# On Debian and Ubuntu, the following will get you the dependencie
apt-get install -qqy libboost-dev libboost-serialization-dev libboost-system-dev libboost-thread-dev libboost-context-dev libssl-dev g++ make pkg-config libluajit-5.1-dev

wget https://downloads.powerdns.com/releases/pdns-recursor-4.3.4.tar.bz2
# Compiling
# ./configure
# make
echo "==========================Compiling PowerDNS Recursor==============================================================="
