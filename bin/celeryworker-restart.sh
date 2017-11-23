#!/bin/sh

ORIGINAL_DIR=`pwd`

SCRIPT_HOME=$(cd "$(dirname "$0")"; pwd)

cd $SCRIPT_HOME

source celeryworker-stop.sh
sleep 2
source celeryworker-start.sh

cd $ORIGINAL_DIR