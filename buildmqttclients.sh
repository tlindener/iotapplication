#!/bin/bash
cd /home/iot/iotframework/adult1
docker build --rm -t tlindener/mqttclientadult1 .
for i in {6..10}
do
	mqttserver=$(sudo docker run -d -P tlindener/mqttclientadult1)
	cd /home/iot/iotframework
	./pipework br1 $mqttserver 192.168.5.$i/24
done
cd /home/iot/iotframework/adult2
docker build --rm -t tlindener/mqttclientadult2 .
for i in {11..15}
do
	mqttserver=$(sudo docker run -d -P tlindener/mqttclientadult2)
	cd /home/iot/iotframework
	./pipework br1 $mqttserver 192.168.5.$i/24
done

