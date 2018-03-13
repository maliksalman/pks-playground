#!/bin/bash

# Verify that we can parse the hostname to determine the borker-id
HOST=$(hostname -s)
if [[ $HOST =~ (.*)-([0-9]+)$ ]]; then
    NAME=${BASH_REMATCH[1]}
    ORD=${BASH_REMATCH[2]}
else
    echo "Fialed to parse name and ordinal of Pod"
    exit 1
fi

## Start the broker with multiple listeners 0 for external consumption
#NODE_PORT=$(cat /usr/etc/kafka/kafka-${ORD}.nodeport)
#kafka/bin/kafka-server-start.sh /usr/etc/kafka/server.properties \
#	--override broker.id=$ORD \
#	--override listener.security.protocol.map=INT:PLAINTEXT,EXT:PLAINTEXT \
#	--override inter.broker.listener.name=INT \
#	--override advertised.listeners=EXT://${NODE_HOSTNAME}:${NODE_PORT},INT://${HOST}.${DOMAIN}:9092 \
#	--override listeners=EXT://0.0.0.0:${NODE_PORT},INT://0.0.0.0:9092 \
#	--override zookeeper.connect=zk-cs:$ZK_CS_SERVICE_PORT

# start the kafka server
kafka/bin/kafka-server-start.sh /usr/etc/kafka/server.properties \
	--override broker.id=$ORD \
	--override advertised.listeners=PLAINTEXT://$(hostname -f):9092 \
	--override listeners=PLAINTEXT://0.0.0.0:9092 \
	--override zookeeper.connect=zk-cs:$ZK_CS_SERVICE_PORT
