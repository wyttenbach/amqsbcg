#!/bin/bash
. common.sh

/opt/mqm/samp/bin/amqsbcg $QUEUE_NAME $QUEUE_MANAGER > $TEMP_FILE
wc -l $TEMP_FILE
awk '/PutDate/ { print $3 }' $TEMP_FILE | sort | uniq | wc -l
