#!/bin/bash

( cd ui/tts ; ng build --prod )
bazel build //java/com/jermowery/audio/server:ApiServer_deploy.jar
./bazel-bin/java/com/jermowery/audio/server/ApiServer