#!/bin/bash

echo "Starting Mary TTS STTS."
export GRADLE_USER_HOME=/srv/mary-tts-stts/src/gradle_user_home
cd src/marytts
./gradlew run --no-rebuild -Dmodules.poweronselftest=false

/bin/bash
