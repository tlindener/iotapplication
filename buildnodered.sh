#!/bin/bash
cd /home/iot/iotapplication/nodered
docker build --rm -t tlindener/nodered .
nodered=$(sudo docker run -d -p 1880:1880 --name nodered tlindener/nodered)
cd /home/iot/iotapplication
./pipework br1 $nodered 192.168.5.4/24
