#!/bin/bash

echo "Starting Mishkal webserver."
src/mishkal/interfaces/web/mishkal-webserver.py &

echo "Waiting 10 seconds for Mishkal webserver to start before starting Mary TTS..."
sleep 10
echo "Waited 10 seconds for Mishkal webserver to start before starting Mary TTS."


echo "Starting Mary TTS STTS."
#export GRADLE_USER_HOME=/srv/app/srv/gradle_cache
cd src/marytts
./gradlew run

