#!/bin/bash
echo "Starting Mishkal webserver."
/srv/app/src/mishkal/interfaces/web/mishkal-webserver &
sleep 10
echo "Waited 10 seconds for Mishkal webserver to start before starting Mary TTS."
export GRADLE_USER_HOME=/srv/app/srv/gradle_cache
cd /srv/app/src/marytts
./gradlew run

