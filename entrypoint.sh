#!/bin/bash

echo "Starting Mary TTS STTS."
export GRADLE_USER_HOME=/srv/mary-tts-stts/src/gradle_user_home
#export MARY_TTS_MISHKAL_URL=http://localhost:8080/
#cd src/marytts
#./gradlew run --no-rebuild -Dmodules.poweronselftest=false
cd src/marytts/build/install/marytts/
./bin/marytts-server
#/bin/bash
