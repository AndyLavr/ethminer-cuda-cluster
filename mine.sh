#!/bin/bash

STRATUM=$(curl -s https://s3.ca-central-1.amazonaws.com/mdaemon/cluster.html | egrep ^stratum | awk -F';;' '{print $2}')
FAILOVER_STRATUM=$(curl -s https://s3.ca-central-1.amazonaws.com/mdaemon/cluster.html | egrep ^failover_stratum | awk -F';;' '{print $2}')
ETH_WALLET=$(curl -s https://s3.ca-central-1.amazonaws.com/mdaemon/cluster.html | egrep eth_wallet | awk -F';;' '{print $2}')

export GPU_FORCE_64BIT_PTR=0
export GPU_MAX_HEAP_SIZE=100
export GPU_USE_SYNC_OBJECTS=1
export GPU_MAX_ALLOC_PERCENT=100
export GPU_SINGLE_ALLOC_PERCENT=100

./ethminer -U -S $STRATUM -FS $FAILOVER_STRATUM -O ${ETH_WALLET}.${HOSTNAME} --farm-recheck 200
