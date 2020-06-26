#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script


echo "=============================Microservices demo with event driven architecture============================================================="
#https://github.com/cealer/microservices-demo
git clone https://github.com/cealer/microservices-demo.git && cd microservices-demo
docker-compose build #Build the services
docker-compose up -d #Run services
sleep 1m
curl http://localhost:61945/Records
curl http://127.0.0.1:61945/Records
curl http://localhost:8888 #Open Angular client
curl http://127.0.0.1:8888
