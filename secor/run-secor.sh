#!/bin/bash

source /etc/profile

secor_properties="file:///${SECOR_PROPERTIES}"
log4j_properties="file:///${LOG4J_PROPERTIES}"
secor="${SECOR_HOME}/secor-${SECOR_VERSION}.jar"
classpath="${secor}:${SECOR_HOME}/lib/*"
mainclass="com.pinterest.secor.main.ConsumerMain"

set -eux
exec java -ea -cp $classpath -Dconfig=${secor_properties} -Dlog4j.configuration=${log4j_properties} ${mainclass}
