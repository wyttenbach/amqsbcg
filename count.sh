#!/bin/bash
. common.sh

/opt/mqm/samp/bin/amqsbcg $QUEUE_NAME $QUEUE_MANAGER | awk '/PutDate/ { print $3 }' | sort | uniq | wc -l
