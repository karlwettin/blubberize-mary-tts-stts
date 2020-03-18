#!/bin/bash

echo "Starting Mishkal webserver."
src/mishkal/interfaces/web/mishkal-webserver.py &

echo "Waiting 10 seconds for Mishkal webserver to start before starting Mary TTS..."
sleep 10
echo "Waited 10 seconds for Mishkal webserver to start before starting Mary TTS."


echo "Starting Mary TTS STTS."
export GRADLE_USER_HOME=/srv/mary-tts-stts/src/gradle_user_home
cd src/marytts
./gradlew run --no-rebuild

/bin/bash
