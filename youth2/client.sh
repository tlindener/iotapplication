#!/bin/bash
random =$((RANDOM % 80 +1))
while true;
do
for line in $(cat /root/data.txt);
do
   mosquitto_pub -h 192.168.5.5 -p 1883 -t /health/sensors/heartrate/youth$random -m "{"Person": "Youth$random","Heartrate": $line,"Excercise": true}"
sleep 5; done
done