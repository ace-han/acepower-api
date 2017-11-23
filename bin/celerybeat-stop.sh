#!/bin/sh

ORIGINAL_DIR=`pwd`
SCRIPT_HOME=$(cd "$(dirname "$0")"; pwd)

PROJECT_HOME=$SCRIPT_HOME/..
cd $PROJECT_HOME

WORK_DIR=$PROJECT_HOME/celeryapp

BEAT_COUNT=`ps -ef | grep "celery beat" | grep -v grep | wc -l`

if [ $BEAT_COUNT -gt 0 ]; then
    ps -ef | grep "celery beat" | grep -v grep | awk '{print $2}' | xargs kill
    echo 'celery beat stopped'
else
    echo "celery beat already stopped"
fi

cd $ORIGINAL_DIR