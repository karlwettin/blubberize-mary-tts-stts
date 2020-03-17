## prepare.sh

* Clones (or pulls existing) repositories to `./src`
* Builds Mary TTS STTS using a local Gradle cache in ./src/gradle_cache

## build.sh

* Removes all but the Maven repository in ./src/gradle_cache/caches
* Creates the Docker image from Blubber YAML.

## run.sh

* Starts the Docker image on local Docker.
