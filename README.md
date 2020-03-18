## prepare.sh

* Clones (or pulls existing) repositories to `./src`
* Builds Mary TTS STTS using a local Gradle cache in ./src/gradle_cache

## build.sh

* Removes all but the Maven repository in ./src/gradle_cache/caches
* Creates the Docker image from Blubber YAML.

## run.sh

* Starts the Docker image on local Docker.

## Regading insecurity of Blubber

* Gradle needs to create lock files in /srv/mary-tts-stts/src/gradle_user_home. 
If there is a way to copy that path to ~runuser/.gradle with the right permissions
instead, then we might be able to get around the problem.
 
* Mishkal logs to disk. Create a diff that sends log to stdout instead.
