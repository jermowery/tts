load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

RULES_JVM_EXTERNAL_TAG = "3.3"

RULES_JVM_EXTERNAL_SHA = "d85951a92c0908c80bd8551002d66cb23c3434409c814179c0ff026b53544dab"

http_archive(
    name = "rules_jvm_external",
    sha256 = RULES_JVM_EXTERNAL_SHA,
    strip_prefix = "rules_jvm_external-%s" % RULES_JVM_EXTERNAL_TAG,
    url = "https://github.com/bazelbuild/rules_jvm_external/archive/%s.zip" % RULES_JVM_EXTERNAL_TAG,
)

load("@rules_jvm_external//:defs.bzl", "maven_install")

maven_install(
    artifacts = [
        "com.google.cloud:google-cloud-texttospeech:1.2.7",
        "com.google.guava:guava:30.1-jre",
        "com.beust:jcommander:1.78",
        "com.google.inject:guice:4.2.3",
        "junit:junit:4.13.1",
        "com.google.truth:truth:1.1",
        "com.google.protobuf:protobuf-java:3.14.0",
        "com.google.api-client:google-api-client:1.31.1",
        "com.google.api:api-common:1.10.1",
        "com.google.api.grpc:proto-google-cloud-texttospeech-v1:1.2.7",
        "org.mockito:mockito-core:3.6.28",
        "com.google.auto.value:auto-value:1.7.4",
        "com.google.auto.value:auto-value-annotations:1.7.4",
        "com.google.code.gson:gson:2.8.6",
    ],
    repositories = [
        "https://jcenter.bintray.com/",
        "https://maven.google.com",
        "https://repo1.maven.org/maven2",
    ],
)
