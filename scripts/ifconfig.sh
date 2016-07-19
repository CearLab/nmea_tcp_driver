#!/bin/sh

a=0

while [ $a -lt 10 ]
do
   echo "turtlebot" | sudo ifconfig usb0 192.168.2.2
done







