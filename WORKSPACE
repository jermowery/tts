load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

RULES_JVM_EXTERNAL_TAG = "3.3"
RULES_JVM_EXTERNAL_SHA = "d85951a92c0908c80bd8551002d66cb23c3434409c814179c0ff026b53544dab"

http_archive(
    name = "rules_jvm_external",
    strip_prefix = "rules_jvm_external-%s" % RULES_JVM_EXTERNAL_TAG,
    sha256 = RULES_JVM_EXTERNAL_SHA,
    url = "https://github.com/bazelbuild/rules_jvm_external/archive/%s.zip" % RULES_JVM_EXTERNAL_TAG,
)

load("@rules_jvm_external//:defs.bzl", "maven_install")

maven_install(
    artifacts = [
        "com.google.code.findbugs:jsr305:3.0.1",
        "com.google.api:gax:jar:1.25.0",
        "io.grpc:grpc-core:1.10.1",
        "joda-time:joda-time:2.9.2",
        "aopalliance:aopalliance:1.0",
        "org.apache.httpcomponents:httpcore:4.0.1",
        "com.google.protobuf:protobuf-java:3.5.1",
        "io.grpc:grpc-stub:1.10.1",
        "io.grpc:grpc-protobuf:1.10.1",
        "org.threeten:threetenbp:1.3.3",
        "com.google.cloud:google-cloud-core-grpc:1.30.0",
         "com.google.truth:truth:0.40",
         "com.google.errorprone:error_prone_annotations:2.1.3",
         "com.google.protobuf:protobuf-java-util:3.5.1",
         "com.google.api:api-common:1.5.0",
          "com.google.api:api-common:1.5.0",
           "com.google.auth:google-auth-library-credentials:0.9.1",
           "com.google.inject:guice:4.2.0",
           "io.opencensus:opencensus-contrib-grpc-metrics:0.11.0",
           "io.opencensus:opencensus-api:0.11.0",
           "com.googlecode.java-diff-utils:diffutils:1.3.0",
           "com.google.truth:truth:jar:0.40",
           "io.grpc:grpc-netty-shaded:1.10.1",
           "com.google.cloud:google-cloud-texttospeech:0.48.0-beta",
            "com.google.api.grpc:proto-google-cloud-texttospeech-v1beta1:0.13.0",
            "commons-logging:commons-logging:1.1.1",
            "org.hamcrest:hamcrest-core:1.3",
            "com.google.code.gson:gson:2.7",
            "javax.inject:javax.inject:1",
            "com.google.http-client:google-http-client:1.23.0",
            "org.apache.httpcomponents:httpclient:4.0.1",
            "com.google.api.grpc:proto-google-iam-v1:0.12.0",
            "org.mockito:mockito-all:2.0.2-beta",
            "com.google.http-client:google-http-client-jackson2:1.19.0",
            "io.grpc:grpc-context:1.10.1",
            "com.google.api:gax-grpc:1.25.0",
            "com.google.api.grpc:proto-google-common-protos:1.11.0",
            "com.google.guava:guava:25.0-jre",
            "com.beust:jcommander:1.72",
            "com.google.cloud:google-cloud-core:1.30.0",
            "io.grpc:grpc-auth:1.10.1",
             "com.google.api:gax:1.25.0",
             "com.fasterxml.jackson.core:jackson-core:2.1.3",
            
    ],
    repositories = [
        "https://jcenter.bintray.com/",
        "https://maven.google.com",
        "https://repo1.maven.org/maven2",
    ],
)