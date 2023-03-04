#!/bin/env zsh

# Java
export JAVA_OPTS="-Dfile.encoding=UTF-8"

# CLASSPATH
# export CLASSPATH=${CLASSPATH}:.
if [ -r ${HOME}/lib/java/classpath ]; then
  if [ -z "$CLASSPATH" ]; then
    export CLASSPATH=`cat ${HOME}/lib/java/classpath`
  else
    export CLASSPATH=`cat ${HOME}/lib/java/classpath`:$CLASSPATH
  fi
fi

# end
