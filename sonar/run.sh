#!/bin/bash

set -e

if [ "${1:0:1}" != '-' ]; then
  exec "$@"
fi

chown -R sonarqube:sonarqube $SONARQUBE_HOME
exec gosu sonarqube \
  java -jar lib/sonar-application-$SONAR_VERSION.jar \
  -Dsonar.log.console=true \
  -Dsonar.jdbc.username="$SONARQUBE_JDBC_USERNAME" \
  -Dsonar.jdbc.password="$SONARQUBE_JDBC_PASSWORD" \
  -Dsonar.jdbc.url="$SONARQUBE_JDBC_URL" \
  -Dsonar.web.javaAdditionalOpts="$SONARQUBE_WEB_JVM_OPTS -Djava.security.egd=file:/dev/./urandom" \
  "$@"
  # Additional scripts: scanning source code
  cd /opt/barwa/adapters/GroupAdapters && mvn compile && mvn sonar:sonar   -Dsonar.sources=.   -Dsonar.host.url=http://localhost:9000   -Dsonar.login=admin -Dsonar.password=admin -Dsonar.inclusions=**/*Test.class
  cd /opt/barwa/barwa && sonar-scanner -Dsonar.projectKey=barwa-front -Dsonar.sources=./src -Dsonar.host.url=http://localhost:9000 -Dsonar.login=admin -Dsonar.password=admin