#!/bin/bash

m_error() {
  echo $1
  exit 2
}

if [[ -n "$JAVA_HOME" ]] && [[ -x "$JAVA_HOME/bin/java" ]];  then
  _java="$JAVA_HOME/bin/java"
else
  m_error "JAVA_HOME is not pointing at a valid java home."
fi

if [[ "$_java" ]]; then
  version=$("$_java" -version 2>&1 | awk -F '"' '/version/ {print $2}')
  if ! [[ "$version" =~ ^1\.8\..* ]]; then
    m_error "JAVA_HOME must point at 1.8, but was $version. Try update-java-alternatives -l"
  fi
fi

if [ ! -d "src" ]
then
  mkdir src
fi
cd src

if [ -d "mishkal" ] ; then
  cd mishkal
  if ! git pull; then
    m_error "Unable to pull from Mishkal git repo!"
  fi
else
  if ! git clone https://github.com/linuxscout/mishkal.git; then
    m_error "Unable to clone Mishkal git repo!"
  fi
  cd mishkal
  git apply ../../mishkal.diff
fi

# back to src
cd ..

# set gradle repository
GRADLE_USER_HOME_BAK=${GRADLE_USER_HOME}
if [ ! -d "gradle_cache" ]
then
  mkdir gradle_cache
fi
cd gradle_cache
export GRADLE_USER_HOME=`pwd`
#back to src
cd ..

if [ -d marytts ] ; then
  cd marytts
  if ! git pull; then
    m_error "Unable to pull from Mary TTS STTS git repo!"
  fi
else
  if ! git clone https://github.com/stts-se/marytts.git; then
    m_error "Unable to clone Mary TTS STTS git repo!"
  fi
  cd marytts
fi

if ! ./gradlew clean build -x test; then
  m_error "Unable to build Mary TTS STTS!"
fi

if ! ./gradlew installDist; then
  m_error "Unable to build distribution of Mary TTS STTS!"
fi
if ! cp stts_voices/voice-ar-nah-hsmm-5.2.jar stts_voices/voice-dfki-spike-hsmm-5.1.jar stts_voices/voice-stts_no_nst-hsmm-5.2.jar stts_voices/voice-stts_sv_nst-hsmm-5.2-SNAPSHOT.jar build/install/marytts/lib/; then
  m_error "Unable to install voices to Mary TTS STTS!"
fi
export GRADLE_USER_HOME=${GRADLE_USER_HOME_BAK}
# back to src
cd ..

# back to root
cd ..

echo "Success!"
