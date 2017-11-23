#!/bin/sh

ORIGINAL_DIR=`pwd`
SCRIPT_HOME=$(cd "$(dirname "$0")"; pwd)

PROJECT_HOME=$SCRIPT_HOME/..
cd $PROJECT_HOME

WORK_DIR=$PROJECT_HOME/celeryapp
mkdir -p $WORK_DIR

celery beat -A acepower_api --detach --schedule "$WORK_DIR/celerybeat-schedule" --pidfile "$WORK_DIR/celerybeat.pid" --loglevel INFO --logfile "$WORK_DIR/celerybeat.log" --max-interval 30

echo 'celery beat started'

sleep 1

ps -ef | grep 'celery beat'

cd $ORIGINAL_DIR