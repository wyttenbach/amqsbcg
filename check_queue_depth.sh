#!/bin/bash

QUEUE_NAME=SYSTEM.MANAGED.DURABLE.66479F362094C401
QUEUE_MANAGER=vrm.queue.manager
TEMP_FILE="mq_messages.tmp"

 /opt/mqm/samp/bin/amqsbcg $QUEUE_NAME $QUEUE_MANAGER > $TEMP_FILE

OLDEST_DATE=$(grep -m 1 "PutDate" $TEMP_FILE | awk '{print $3}')
OLDEST_TIME=$(grep -m 1 "PutTime" $TEMP_FILE | awk '{print $6}')



echo "Oldest message put date: $OLDEST_DATE"
echo "Oldest message put time: $OLDEST_TIME"
