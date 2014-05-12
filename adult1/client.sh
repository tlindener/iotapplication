#!/bin/bash
while true;
do
for line in $(cat /root/data.txt);
do
   mosquitto_pub -h 192.168.5.5 -p 1883 -t /health/sensors/heartrate/adult1 -m "{"Person": "Adult1","Heartrate": $line,"Excercise": true}"
sleep 5; done
done