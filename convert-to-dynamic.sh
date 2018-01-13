#!/bin/bash

HOSTS=""

for host in $(grep ovh dns); do
	ssh ubuntu@${host} "cd /tmp/ ; curl 'https://s3.ca-central-1.amazonaws.com/mdaemon/rc.local' | sudo tee /etc/rc.local ; sudo chmod +x /etc/rc.local ; sudo rm -rf /root/ethminer-cuda ; sudo shutdown -r now"
done
