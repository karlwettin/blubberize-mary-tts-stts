#!/bin/bash
echo "Starting Mishkal webserver."
/srv/app/src/mishkal/interfaces/web/mishkal-webserver &
sleep 10
echo "Waited 10 seconds for Mishkal webserver to start before starting Mary TTS."
cd /srv/app/src/marytts
./gradlew run

