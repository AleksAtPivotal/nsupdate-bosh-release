#!/bin/bash

DATA_DIR=/var/vcap/store/custom-dns-update
LOG_DIR=/var/vcap/sys/log/custom-dns-update
RUN_DIR=/var/vcap/sys/run/custom-dns-update
PIDFILE=${RUN_DIR}/custom-dns-update.pid

case $1 in

  start)

    mkdir -p $RUN_DIR $LOG_DIR $DATA_DIR
    chown -R vcap:vcap $RUN_DIR
    chown -R vcap:vcap $LOG_DIR
    chown -R vcap:vcap $DATA_DIR

    touch $PIDFILE

    exec chpst /var/vcap/jobs/custom-dns-update/bin/start.sh $DATA_DIR $LOG_DIR >>  $LOG_DIR/custom-dns-update.stdout.log \
      2>> $LOG_DIR/custom-dns-update.stderr.log

    ;;

  stop)
    rm -f $PIDFILE
    exec chpst /var/vcap/jobs/custom-dns-update/bin/stop.sh $DATA_DIR $LOG_DIR >>  $LOG_DIR/custom-dns-update.stdout.log \
      2>> $LOG_DIR/custom-dns-update.stderr.log


    ;;

  *)
    echo "Usage: ctl {start|stop}" ;;

esac