#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset
set -o xtrace
# set -eox pipefail #safety for script


# echo "=============================Microservices  with event driven architecture============================================================="
# #https://github.com/cealer/microservices-demo
# git clone https://github.com/cealer/microservices-demo.git && cd microservices-demo
# docker-compose build #Build the services
# docker-compose ps
# docker-compose up -d #Run services
# sleep 1m
# curl http://localhost:61945/Records
# curl http://127.0.0.1:61945/Records
# curl http://localhost:8888 #Open Angular client
# curl http://127.0.0.1:8888
#
# docker-compose down #Stop and remove the services

echo "=============================Microservices  with event driven architecture============================================================="
#https://github.com/djarza/football-events
git clone https://github.com/djarza/football-events.git && cd football-events

cat /etc/hosts
cat <<EOT | sudo tee -a /etc/hosts
127.0.0.1 kafka
127.0.0.1 postgres
127.0.0.1 connect
127.0.0.1 football-match
127.0.0.1 football-player
127.0.0.1 football-view-basic
127.0.0.1 football-view-top
127.0.0.1 football-ui
EOT
cat /etc/hosts

# cd football && mvn install #Build microservices and Docker containers
#
# Build and run the demo application:
# cd football-tests
# mvn install -DskipTests
# java -jar target/football-tests-0.0.1-SNAPSHOT-jar-with-dependencies.jar

#If the default startup timeout (180 sec) will be insufficient, try to increase
# java -jar target/football-tests-0.0.1-SNAPSHOT-jar-with-dependencies.jar 400

# sleep 2m
# curl http://football-ui:18080/
