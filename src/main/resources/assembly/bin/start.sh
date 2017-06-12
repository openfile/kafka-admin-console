#!/bin/sh

#------------------------- environment variabls -------------------------
NAME="application"
PROG="$0"
PROGDIR=`dirname "$PROG"`
HOME_FOLDER=`cd "$PROGDIR/.." >/dev/null; pwd`
PID_FILE="$HOME_FOLDER/bin/$NAME.pid"
BIN_FOLDER="$HOME_FOLDER/bin"
LIB_FOLDER="$HOME_FOLDER/lib"
CONF_FOLDER="$HOME_FOLDER/conf"

. "$CONF_FOLDER/config.sh"

if [ $JAVA_HOME ]
then
	echo "INFO: JAVA_HOME found at $JAVA_HOME"
	JAVA_BIN=$JAVA_HOME/bin/java
else
	echo "WARN: Cannot find JAVA_HOME environment variable."
    JAVA_BIN=`which java 2>/dev/null`
fi
if [ -z $JAVA_BIN ]
then
    echo "ERROR: No Java found, cannot run application."
    exit 1
fi

PID=$(cat "${PID_FILE}");
if [ -z "${PID}" ]; then
    echo "INFO: Starting $NAME"
    echo "INFO: PID file {$PID_FILE}"
    echo "INFO: Using $JAVA_BIN as Java VM"
    # $JAVA_BIN -server $JAVA_OPTS com.hazelcast.core.server.StartServer $PROG_ARGS &
    # echo $! > ${PID_FILE}
    echo "INFO: Started $NAME at `date`"
    echo "=========================================================================================="
else
    echo "WARN: Another instance of $NAME is already started in this folder."
    echo "INFO: To stop instance run './stop.sh'"
    exit 0
fi
