#!/bin/sh

ORIGINAL_DIR=`pwd`

SCRIPT_HOME=$(cd "$(dirname "$0")"; pwd)

PROJECT_HOME=$SCRIPT_HOME/..
cd $PROJECT_HOME

WORK_DIR=$PROJECT_HOME/celeryapp

# start 1 worker with 2 processes
celery multi start 1 -A acepower_api --pidfile="$WORK_DIR/%h.pid" --concurrency=2 --logfile="$WORK_DIR/%h%I.log" --loglevel=INFO
echo 'celery worker started'

sleep 1

ps -ef | grep 'celery worker'

cd $ORIGINAL_DIR