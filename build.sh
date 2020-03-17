#!/bin/sh

~/opt/blubber mary-tts-stts.yaml production | docker build --tag wikispeech-mary-tts-stts --file - .
