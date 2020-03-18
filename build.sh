#!/bin/sh

# clean up previous builds
docker rm wikispeech-mary-tts-stts
docker rmi wikispeech-mary-tts-stts

# build docker
~/opt/blubber mary-tts-stts.yaml production | docker build --tag wikispeech-mary-tts-stts --file - .
