#!/bin/bash
. common.sh

/opt/mqm/samp/bin/amqsbcg $QUEUE_NAME $QUEUE_MANAGER > $TEMP_FILE

exe() { echo "\$${@/eval/}" ; "$@" ; }

exe wc -l $TEMP_FILE
exe eval "awk '/PutDate/ { print \$3 }' $TEMP_FILE | wc -l"
exe eval "awk '/PutDate/ { print \$3 }' $TEMP_FILE | sort | uniq | wc -l"
