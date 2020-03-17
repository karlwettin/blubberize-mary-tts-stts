#!/bin/bash
python -m pip install wheel
python -m pip install pyarabic arramooz-pysqlite qalsadi tashaphyne mysam-tagmanager


echo "Starting Mishkal webserver."
/srv/app/src/mishkal/interfaces/web/mishkal-webserver.py &

sleep 10
echo "Waited 10 seconds for Mishkal webserver to start before starting Mary TTS."
export GRADLE_USER_HOME=/srv/app/srv/gradle_cache
cd /srv/app/src/marytts
./gradlew run 

