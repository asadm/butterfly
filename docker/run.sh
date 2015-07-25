#!/bin/sh

# Set password
#echo "root:${PASSWORD}" | chpasswd

if [ -z ${PORT} ]
then
  echo "Starting on default port: 57575"
  /opt/app/butterfly.server.py --unsecure --host=0.0.0.0
else
  echo "Starting on port: ${PORT}"
 # function exit() { clear;}
  /opt/app/butterfly.server.py --unsecure --host=0.0.0.0 --port=${PORT} --login=false --motd="" --cmd="screen -x default" & cd /home & screen -d -R default -s /bin/bash
  #screen -d -R default
fi
