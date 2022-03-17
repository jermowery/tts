#!/bin/bash

( cd ui/tts ; ng build --configuration production )
bazel build //java/com/jermowery/audio/server:ApiServer_deploy.jar
./bazel-bin/java/com/jermowery/audio/server/ApiServer