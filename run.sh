#!/bin/bash

angular_output_path=$PWD/resources
( cd ui/tts ; ng build --configuration production --output_path $angular_output_path )
bazel build //java/com/jermowery/audio/server2:ApiServer_deploy.jar
./bazel-bin/java/com/jermowery/audio/server2/ApiServer