#!/bin/bash
cd /home/iot/iotapplication/mqttserver
docker build --rm -t tlindener/mqttserver .
mqttserver=$(sudo docker run -d -P --name mqttserver tlindener/mqttserver)
cd /home/iot/iotapplication
./pipework br1 $mqttserver 192.168.5.5/24
