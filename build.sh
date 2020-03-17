#!/bin/sh

# clean up previous builds
docker rm wikispeech-mary-tts-stts
docker rmi wikispeech-mary-tts-stts

# clean up gradle from anything but dependencies
mv src/gradle_cache/caches src/gradle_caches.tmp
rm -rf src/gradle_cache
mkdir src/gradle_cache
mv src/gradle_caches.tmp src/gradle_cache/caches

# build docker
~/opt/blubber mary-tts-stts.yaml production | docker build --tag wikispeech-mary-tts-stts --file - .
