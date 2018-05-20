# The following dependencies were calculated from:
#
# generate_workspace --output_dir /usr/local/google/home/jermowery/tts/third_party --repositories=https://repo1.maven.org/maven2/ --artifact=com.google.guava:guava:25.0-jre --artifact=com.beust:jcommander:1.72 --artifact=com.google.inject:guice:4.2.0 --artifact=com.google.cloud:google-cloud-core:1.30.0 --artifact=com.google.truth:truth:0.40 --artifact=com.google.cloud:google-cloud-texttospeech:0.48.0-beta


def generated_maven_jars():
  # com.google.api:gax:jar:1.25.0 wanted version 3.0.0
  # io.grpc:grpc-core:jar:1.10.1 wanted version 3.0.0
  # com.google.api:api-common:jar:1.5.0 wanted version 3.0.0
  # com.google.cloud:google-cloud-core:jar:1.30.0
  # com.google.api:gax-grpc:jar:1.25.0 wanted version 3.0.0
  native.maven_jar(
      name = "com_google_code_findbugs_jsr305",
      artifact = "com.google.code.findbugs:jsr305:3.0.1",
      sha1 = "f7be08ec23c21485b9b5a1cf1654c2ec8c58168d",
  )


  # com.google.api:gax:jar:1.25.0
  # com.google.api:gax-grpc:jar:1.25.0 got requested version
  native.maven_jar(
      name = "com_google_auth_google_auth_library_oauth2_http",
      artifact = "com.google.auth:google-auth-library-oauth2-http:0.9.1",
      sha1 = "c0fe3a39b0f28d59de1986b3c50f018cd7cb9ec2",
  )


  # io.grpc:grpc-stub:jar:1.10.1 got requested version
  # io.grpc:grpc-netty-shaded:jar:1.10.1 got requested version
  # io.grpc:grpc-protobuf-lite:jar:1.10.1 got requested version
  # io.grpc:grpc-protobuf:jar:1.10.1
  # io.grpc:grpc-auth:jar:1.10.1 got requested version
  native.maven_jar(
      name = "io_grpc_grpc_core",
      artifact = "io.grpc:grpc-core:1.10.1",
      sha1 = "7de67f821dc0f384f00c69ed7f833a52184972bd",
  )


  # io.grpc:grpc-protobuf:jar:1.10.1
  native.maven_jar(
      name = "io_grpc_grpc_protobuf_lite",
      artifact = "io.grpc:grpc-protobuf-lite:1.10.1",
      sha1 = "d1d4a578b39901ad0749f11cee867cb6267812e4",
  )


  # com.google.cloud:google-cloud-core:jar:1.30.0
  native.maven_jar(
      name = "joda_time_joda_time",
      artifact = "joda-time:joda-time:2.9.2",
      sha1 = "36d6e77a419cb455e6fd5909f6f96b168e21e9d0",
  )


  # com.google.inject:guice:jar:4.2.0
  native.maven_jar(
      name = "aopalliance_aopalliance",
      artifact = "aopalliance:aopalliance:1.0",
      sha1 = "0235ba8b489512805ac13a8f9ea77a1ca5ebe3e8",
  )


  # org.apache.httpcomponents:httpclient:jar:4.0.1
  native.maven_jar(
      name = "org_apache_httpcomponents_httpcore",
      artifact = "org.apache.httpcomponents:httpcore:4.0.1",
      sha1 = "e813b8722c387b22e1adccf7914729db09bcb4a9",
  )


  # io.grpc:grpc-protobuf:jar:1.10.1 got requested version
  # com.google.api.grpc:proto-google-iam-v1:jar:0.12.0 got requested version
  # com.google.api.grpc:proto-google-common-protos:jar:1.11.0 got requested version
  # com.google.cloud:google-cloud-core-grpc:jar:1.30.0 got requested version
  # com.google.protobuf:protobuf-java-util:bundle:3.5.1
  # com.google.api.grpc:proto-google-cloud-texttospeech-v1beta1:jar:0.13.0 got requested version
  native.maven_jar(
      name = "com_google_protobuf_protobuf_java",
      artifact = "com.google.protobuf:protobuf-java:3.5.1",
      sha1 = "8c3492f7662fa1cbf8ca76a0f5eb1146f7725acd",
  )


  # com.google.cloud:google-cloud-core-grpc:jar:1.30.0
  # com.google.cloud:google-cloud-texttospeech:jar:0.48.0-beta got requested version
  # com.google.api:gax-grpc:jar:1.25.0 got requested version
  native.maven_jar(
      name = "io_grpc_grpc_stub",
      artifact = "io.grpc:grpc-stub:1.10.1",
      sha1 = "d0e3785fb534ede2f4ab5267b1b13d50b7c67656",
  )


  # org.apache.httpcomponents:httpclient:jar:4.0.1
  native.maven_jar(
      name = "commons_codec_commons_codec",
      artifact = "commons-codec:commons-codec:1.3",
      sha1 = "fd32786786e2adb664d5ecc965da47629dca14ba",
  )


  # com.google.cloud:google-cloud-core-grpc:jar:1.30.0
  # com.google.api:gax-grpc:jar:1.25.0 got requested version
  native.maven_jar(
      name = "io_grpc_grpc_protobuf",
      artifact = "io.grpc:grpc-protobuf:1.10.1",
      sha1 = "d7c3fef8ba3b741a7af15c011ca8052c00c354d6",
  )


  # com.google.api:gax:jar:1.25.0
  # com.google.api:gax-grpc:jar:1.25.0 got requested version
  native.maven_jar(
      name = "org_threeten_threetenbp",
      artifact = "org.threeten:threetenbp:1.3.3",
      sha1 = "3ea31c96676ff12ab56be0b1af6fff61d1a4f1f2",
  )


  # com.google.cloud:google-cloud-texttospeech:jar:0.48.0-beta
  native.maven_jar(
      name = "com_google_cloud_google_cloud_core_grpc",
      artifact = "com.google.cloud:google-cloud-core-grpc:1.30.0",
      sha1 = "895c200c9bc1b7255e53d38c5065678a09c4aabd",
  )


  native.maven_jar(
      name = "com_google_truth_truth",
      artifact = "com.google.truth:truth:0.40",
      sha1 = "0d74e716afec045cc4a178dbbfde2a8314ae5574",
  )


  # com.google.truth:truth:jar:0.40
  # io.grpc:grpc-core:jar:1.10.1 wanted version 2.1.2
  native.maven_jar(
      name = "com_google_errorprone_error_prone_annotations",
      artifact = "com.google.errorprone:error_prone_annotations:2.1.3",
      sha1 = "39b109f2cd352b2d71b52a3b5a1a9850e1dc304b",
  )


  # io.grpc:grpc-protobuf:jar:1.10.1 got requested version
  # com.google.cloud:google-cloud-core:jar:1.30.0
  # com.google.cloud:google-cloud-core-grpc:jar:1.30.0 got requested version
  native.maven_jar(
      name = "com_google_protobuf_protobuf_java_util",
      artifact = "com.google.protobuf:protobuf-java-util:3.5.1",
      sha1 = "6e40a6a3f52455bd633aa2a0dba1a416e62b4575",
  )


  # com.google.api.grpc:proto-google-iam-v1:jar:0.12.0 got requested version
  # com.google.cloud:google-cloud-core:jar:1.30.0
  # com.google.api:gax:jar:1.25.0 got requested version
  # com.google.api:gax-grpc:jar:1.25.0 got requested version
  # com.google.api.grpc:proto-google-cloud-texttospeech-v1beta1:jar:0.13.0 got requested version
  native.maven_jar(
      name = "com_google_api_api_common",
      artifact = "com.google.api:api-common:1.5.0",
      sha1 = "7e537338d40a57ad469239acb6d828fa544fb52b",
  )


  # com.google.auth:google-auth-library-oauth2-http:jar:0.9.1
  # io.grpc:grpc-auth:jar:1.10.1 wanted version 0.9.0
  # com.google.cloud:google-cloud-core-grpc:jar:1.30.0 got requested version
  # com.google.api:gax-grpc:jar:1.25.0 got requested version
  native.maven_jar(
      name = "com_google_auth_google_auth_library_credentials",
      artifact = "com.google.auth:google-auth-library-credentials:0.9.1",
      sha1 = "25e0f45f3b3d1b4fccc8944845e51a7a4f359652",
  )


  native.maven_jar(
      name = "com_google_inject_guice",
      artifact = "com.google.inject:guice:4.2.0",
      sha1 = "25e1f4c1d528a1cffabcca0d432f634f3132f6c8",
  )


  # io.grpc:grpc-core:jar:1.10.1
  native.maven_jar(
      name = "io_opencensus_opencensus_contrib_grpc_metrics",
      artifact = "io.opencensus:opencensus-contrib-grpc-metrics:0.11.0",
      sha1 = "d57b877f1a28a613452d45e35c7faae5af585258",
  )


  # io.opencensus:opencensus-contrib-grpc-metrics:jar:0.11.0 got requested version
  # io.grpc:grpc-core:jar:1.10.1
  native.maven_jar(
      name = "io_opencensus_opencensus_api",
      artifact = "io.opencensus:opencensus-api:0.11.0",
      sha1 = "c1ff1f0d737a689d900a3e2113ddc29847188c64",
  )


  # com.google.truth:truth:jar:0.40
  native.maven_jar(
      name = "com_googlecode_java_diff_utils_diffutils",
      artifact = "com.googlecode.java-diff-utils:diffutils:1.3.0",
      sha1 = "7e060dd5b19431e6d198e91ff670644372f60fbd",
  )


  # com.google.truth:truth:jar:0.40
  native.maven_jar(
      name = "junit_junit",
      artifact = "junit:junit:4.12",
      sha1 = "2973d150c0dc1fefe998f834810d68f278ea58ec",
  )


  # com.google.cloud:google-cloud-core-grpc:jar:1.30.0
  # com.google.cloud:google-cloud-texttospeech:jar:0.48.0-beta got requested version
  native.maven_jar(
      name = "io_grpc_grpc_netty_shaded",
      artifact = "io.grpc:grpc-netty-shaded:1.10.1",
      sha1 = "52a002acf8f3965cf0179c769766138cc0bb50f0",
  )


  native.maven_jar(
      name = "com_google_cloud_google_cloud_texttospeech",
      artifact = "com.google.cloud:google-cloud-texttospeech:0.48.0-beta",
      sha1 = "84c20736d2e9edbde0f32fe1168cf0e0e689b9da",
  )


  # com.google.cloud:google-cloud-texttospeech:jar:0.48.0-beta
  native.maven_jar(
      name = "com_google_api_grpc_proto_google_cloud_texttospeech_v1beta1",
      artifact = "com.google.api.grpc:proto-google-cloud-texttospeech-v1beta1:0.13.0",
      sha1 = "9bce30dec269edb840369b0db7c1659fa33c4b19",
  )


  # org.apache.httpcomponents:httpclient:jar:4.0.1
  native.maven_jar(
      name = "commons_logging_commons_logging",
      artifact = "commons-logging:commons-logging:1.1.1",
      sha1 = "5043bfebc3db072ed80fbd362e7caf00e885d8ae",
  )


  # junit:junit:jar:4.12
  native.maven_jar(
      name = "org_hamcrest_hamcrest_core",
      artifact = "org.hamcrest:hamcrest-core:1.3",
      sha1 = "42a25dc3219429f0e5d060061f71acb49bf010a0",
  )


  # io.grpc:grpc-core:jar:1.10.1 got requested version
  # com.google.protobuf:protobuf-java-util:bundle:3.5.1
  native.maven_jar(
      name = "com_google_code_gson_gson",
      artifact = "com.google.code.gson:gson:2.7",
      sha1 = "751f548c85fa49f330cecbb1875893f971b33c4e",
  )


  # com.google.inject:guice:jar:4.2.0
  native.maven_jar(
      name = "javax_inject_javax_inject",
      artifact = "javax.inject:javax.inject:1",
      sha1 = "6975da39a7040257bd51d21a231b76c915872d38",
  )


  # com.google.http-client:google-http-client-jackson2:jar:1.23.0 got requested version
  # com.google.auth:google-auth-library-oauth2-http:jar:0.9.1 wanted version 1.19.0
  # com.google.cloud:google-cloud-core:jar:1.30.0
  native.maven_jar(
      name = "com_google_http_client_google_http_client",
      artifact = "com.google.http-client:google-http-client:1.23.0",
      sha1 = "8e86c84ff3c98eca6423e97780325b299133d858",
  )


  # com.google.http-client:google-http-client:jar:1.23.0
  native.maven_jar(
      name = "org_apache_httpcomponents_httpclient",
      artifact = "org.apache.httpcomponents:httpclient:4.0.1",
      sha1 = "1d7d28fa738bdbfe4fbd895d9486308999bdf440",
  )


  # com.google.cloud:google-cloud-core:jar:1.30.0
  native.maven_jar(
      name = "com_google_api_grpc_proto_google_iam_v1",
      artifact = "com.google.api.grpc:proto-google-iam-v1:0.12.0",
      sha1 = "ea312c0250a5d0a7cdd1b20bc2c3259938b79855",
  )


  # com.google.auth:google-auth-library-oauth2-http:jar:0.9.1
  native.maven_jar(
      name = "com_google_http_client_google_http_client_jackson2",
      artifact = "com.google.http-client:google-http-client-jackson2:1.19.0",
      sha1 = "81dbf9795d387d5e80e55346582d5f2fb81a42eb",
  )


  # io.grpc:grpc-core:jar:1.10.1
  # com.google.cloud:google-cloud-core-grpc:jar:1.30.0 got requested version
  native.maven_jar(
      name = "io_grpc_grpc_context",
      artifact = "io.grpc:grpc-context:1.10.1",
      sha1 = "b176ccd403d78d34a4dcf785174251bc499456fa",
  )


  # com.google.cloud:google-cloud-core-grpc:jar:1.30.0
  native.maven_jar(
      name = "com_google_api_gax_grpc",
      artifact = "com.google.api:gax-grpc:1.25.0",
      sha1 = "10b0e7942fec9c8fa46f907517ca026bb647d7f8",
  )


  # io.grpc:grpc-protobuf:jar:1.10.1 wanted version 1.0.0
  # com.google.api.grpc:proto-google-iam-v1:jar:0.12.0 got requested version
  # com.google.cloud:google-cloud-core:jar:1.30.0
  # com.google.api:gax-grpc:jar:1.25.0 wanted version 1.0.0
  # com.google.api.grpc:proto-google-cloud-texttospeech-v1beta1:jar:0.13.0 got requested version
  native.maven_jar(
      name = "com_google_api_grpc_proto_google_common_protos",
      artifact = "com.google.api.grpc:proto-google-common-protos:1.11.0",
      sha1 = "461c0ca22a2da16107c8e047743991052ee8d1e6",
  )


  # com.google.api:gax:jar:1.25.0 wanted version 20.0
  # com.google.cloud:google-cloud-core:jar:1.30.0 wanted version 20.0
  # com.google.auth:google-auth-library-oauth2-http:jar:0.9.1 wanted version 19.0
  # com.google.truth:truth:jar:0.40 wanted version 23.4-android
  # io.opencensus:opencensus-api:jar:0.11.0 wanted version 19.0
  # com.google.inject:guice:jar:4.2.0 wanted version 23.6-android
  # io.grpc:grpc-protobuf:jar:1.10.1 wanted version 19.0
  # io.grpc:grpc-protobuf-lite:jar:1.10.1 wanted version 19.0
  # com.google.api:gax-grpc:jar:1.25.0 wanted version 20.0
  # io.grpc:grpc-core:jar:1.10.1 wanted version 19.0
  # com.google.protobuf:protobuf-java-util:bundle:3.5.1 wanted version 19.0
  # com.google.cloud:google-cloud-core-grpc:jar:1.30.0 wanted version 20.0
  # com.google.api:api-common:jar:1.5.0 wanted version 19.0
  native.maven_jar(
      name = "com_google_guava_guava",
      artifact = "com.google.guava:guava:25.0-jre",
      sha1 = "7319c34fa5866a85b6bad445adad69d402323129",
  )


  native.maven_jar(
      name = "com_beust_jcommander",
      artifact = "com.beust:jcommander:1.72",
      sha1 = "6375e521c1e11d6563d4f25a07ce124ccf8cd171",
  )


  # com.google.cloud:google-cloud-core-grpc:jar:1.30.0 got requested version
  # com.google.cloud:google-cloud-texttospeech:jar:0.48.0-beta got requested version
  native.maven_jar(
      name = "com_google_cloud_google_cloud_core",
      artifact = "com.google.cloud:google-cloud-core:1.30.0",
      sha1 = "a392ef5f0385476cd4f5241217bea84388b55860",
  )


  # com.google.cloud:google-cloud-core-grpc:jar:1.30.0
  # com.google.cloud:google-cloud-texttospeech:jar:0.48.0-beta got requested version
  # com.google.api:gax-grpc:jar:1.25.0 got requested version
  native.maven_jar(
      name = "io_grpc_grpc_auth",
      artifact = "io.grpc:grpc-auth:1.10.1",
      sha1 = "eeca2c1de35ad2ff414e2b03d51446645a038605",
  )


  # com.google.cloud:google-cloud-core:jar:1.30.0
  # com.google.api:gax-grpc:jar:1.25.0 got requested version
  native.maven_jar(
      name = "com_google_api_gax",
      artifact = "com.google.api:gax:1.25.0",
      sha1 = "36ab73c0b5d4a67447eb89a3174cc76ced150bd1",
  )


  # com.google.http-client:google-http-client-jackson2:jar:1.23.0
  native.maven_jar(
      name = "com_fasterxml_jackson_core_jackson_core",
      artifact = "com.fasterxml.jackson.core:jackson-core:2.1.3",
      sha1 = "f6c3aed1cdfa21b5c1737c915186ea93a95a58bd",
  )




def generated_java_libraries():
  native.java_library(
      name = "com_google_code_findbugs_jsr305",
      visibility = ["//visibility:public"],
      exports = ["@com_google_code_findbugs_jsr305//jar"],
  )


  native.java_library(
      name = "com_google_auth_google_auth_library_oauth2_http",
      visibility = ["//visibility:public"],
      exports = ["@com_google_auth_google_auth_library_oauth2_http//jar"],
      runtime_deps = [
          ":com_fasterxml_jackson_core_jackson_core",
          ":com_google_auth_google_auth_library_credentials",
          ":com_google_guava_guava",
          ":com_google_http_client_google_http_client",
          ":com_google_http_client_google_http_client_jackson2",
      ],
  )


  native.java_library(
      name = "io_grpc_grpc_core",
      visibility = ["//visibility:public"],
      exports = ["@io_grpc_grpc_core//jar"],
      runtime_deps = [
          ":com_google_code_findbugs_jsr305",
          ":com_google_code_gson_gson",
          ":com_google_errorprone_error_prone_annotations",
          ":com_google_guava_guava",
          ":io_grpc_grpc_context",
          ":io_opencensus_opencensus_api",
          ":io_opencensus_opencensus_contrib_grpc_metrics",
      ],
  )


  native.java_library(
      name = "io_grpc_grpc_protobuf_lite",
      visibility = ["//visibility:public"],
      exports = ["@io_grpc_grpc_protobuf_lite//jar"],
      runtime_deps = [
          ":com_google_guava_guava",
          ":io_grpc_grpc_core",
      ],
  )


  native.java_library(
      name = "joda_time_joda_time",
      visibility = ["//visibility:public"],
      exports = ["@joda_time_joda_time//jar"],
  )


  native.java_library(
      name = "aopalliance_aopalliance",
      visibility = ["//visibility:public"],
      exports = ["@aopalliance_aopalliance//jar"],
  )


  native.java_library(
      name = "org_apache_httpcomponents_httpcore",
      visibility = ["//visibility:public"],
      exports = ["@org_apache_httpcomponents_httpcore//jar"],
  )


  native.java_library(
      name = "com_google_protobuf_protobuf_java",
      visibility = ["//visibility:public"],
      exports = ["@com_google_protobuf_protobuf_java//jar"],
  )


  native.java_library(
      name = "io_grpc_grpc_stub",
      visibility = ["//visibility:public"],
      exports = ["@io_grpc_grpc_stub//jar"],
      runtime_deps = [
          ":io_grpc_grpc_core",
      ],
  )


  native.java_library(
      name = "commons_codec_commons_codec",
      visibility = ["//visibility:public"],
      exports = ["@commons_codec_commons_codec//jar"],
  )


  native.java_library(
      name = "io_grpc_grpc_protobuf",
      visibility = ["//visibility:public"],
      exports = ["@io_grpc_grpc_protobuf//jar"],
      runtime_deps = [
          ":com_google_api_grpc_proto_google_common_protos",
          ":com_google_code_findbugs_jsr305",
          ":com_google_code_gson_gson",
          ":com_google_errorprone_error_prone_annotations",
          ":com_google_guava_guava",
          ":com_google_protobuf_protobuf_java",
          ":com_google_protobuf_protobuf_java_util",
          ":io_grpc_grpc_context",
          ":io_grpc_grpc_core",
          ":io_grpc_grpc_protobuf_lite",
          ":io_opencensus_opencensus_api",
          ":io_opencensus_opencensus_contrib_grpc_metrics",
      ],
  )


  native.java_library(
      name = "org_threeten_threetenbp",
      visibility = ["//visibility:public"],
      exports = ["@org_threeten_threetenbp//jar"],
  )


  native.java_library(
      name = "com_google_cloud_google_cloud_core_grpc",
      visibility = ["//visibility:public"],
      exports = ["@com_google_cloud_google_cloud_core_grpc//jar"],
      runtime_deps = [
          ":com_google_api_api_common",
          ":com_google_api_gax",
          ":com_google_api_gax_grpc",
          ":com_google_api_grpc_proto_google_common_protos",
          ":com_google_auth_google_auth_library_credentials",
          ":com_google_auth_google_auth_library_oauth2_http",
          ":com_google_cloud_google_cloud_core",
          ":com_google_code_findbugs_jsr305",
          ":com_google_code_gson_gson",
          ":com_google_errorprone_error_prone_annotations",
          ":com_google_guava_guava",
          ":com_google_protobuf_protobuf_java",
          ":com_google_protobuf_protobuf_java_util",
          ":io_grpc_grpc_auth",
          ":io_grpc_grpc_context",
          ":io_grpc_grpc_core",
          ":io_grpc_grpc_netty_shaded",
          ":io_grpc_grpc_protobuf",
          ":io_grpc_grpc_protobuf_lite",
          ":io_grpc_grpc_stub",
          ":io_opencensus_opencensus_api",
          ":io_opencensus_opencensus_contrib_grpc_metrics",
          ":org_threeten_threetenbp",
      ],
  )


  native.java_library(
      name = "com_google_truth_truth",
      visibility = ["//visibility:public"],
      exports = ["@com_google_truth_truth//jar"],
      runtime_deps = [
          ":com_google_errorprone_error_prone_annotations",
          ":com_google_guava_guava",
          ":com_googlecode_java_diff_utils_diffutils",
          ":junit_junit",
          ":org_hamcrest_hamcrest_core",
      ],
  )


  native.java_library(
      name = "com_google_errorprone_error_prone_annotations",
      visibility = ["//visibility:public"],
      exports = ["@com_google_errorprone_error_prone_annotations//jar"],
  )


  native.java_library(
      name = "com_google_protobuf_protobuf_java_util",
      visibility = ["//visibility:public"],
      exports = ["@com_google_protobuf_protobuf_java_util//jar"],
      runtime_deps = [
          ":com_google_code_gson_gson",
          ":com_google_guava_guava",
          ":com_google_protobuf_protobuf_java",
      ],
  )


  native.java_library(
      name = "com_google_api_api_common",
      visibility = ["//visibility:public"],
      exports = ["@com_google_api_api_common//jar"],
      runtime_deps = [
          ":com_google_code_findbugs_jsr305",
          ":com_google_guava_guava",
      ],
  )


  native.java_library(
      name = "com_google_auth_google_auth_library_credentials",
      visibility = ["//visibility:public"],
      exports = ["@com_google_auth_google_auth_library_credentials//jar"],
  )


  native.java_library(
      name = "com_google_inject_guice",
      visibility = ["//visibility:public"],
      exports = ["@com_google_inject_guice//jar"],
      runtime_deps = [
          ":aopalliance_aopalliance",
          ":com_google_guava_guava",
          ":javax_inject_javax_inject",
      ],
  )


  native.java_library(
      name = "io_opencensus_opencensus_contrib_grpc_metrics",
      visibility = ["//visibility:public"],
      exports = ["@io_opencensus_opencensus_contrib_grpc_metrics//jar"],
      runtime_deps = [
          ":io_opencensus_opencensus_api",
      ],
  )


  native.java_library(
      name = "io_opencensus_opencensus_api",
      visibility = ["//visibility:public"],
      exports = ["@io_opencensus_opencensus_api//jar"],
      runtime_deps = [
          ":com_google_guava_guava",
      ],
  )


  native.java_library(
      name = "com_googlecode_java_diff_utils_diffutils",
      visibility = ["//visibility:public"],
      exports = ["@com_googlecode_java_diff_utils_diffutils//jar"],
  )


  native.java_library(
      name = "junit_junit",
      visibility = ["//visibility:public"],
      exports = ["@junit_junit//jar"],
      runtime_deps = [
          ":org_hamcrest_hamcrest_core",
      ],
  )


  native.java_library(
      name = "io_grpc_grpc_netty_shaded",
      visibility = ["//visibility:public"],
      exports = ["@io_grpc_grpc_netty_shaded//jar"],
      runtime_deps = [
          ":io_grpc_grpc_core",
      ],
  )


  native.java_library(
      name = "com_google_cloud_google_cloud_texttospeech",
      visibility = ["//visibility:public"],
      exports = ["@com_google_cloud_google_cloud_texttospeech//jar"],
      runtime_deps = [
          ":com_google_api_api_common",
          ":com_google_api_gax",
          ":com_google_api_gax_grpc",
          ":com_google_api_grpc_proto_google_cloud_texttospeech_v1beta1",
          ":com_google_api_grpc_proto_google_common_protos",
          ":com_google_auth_google_auth_library_credentials",
          ":com_google_auth_google_auth_library_oauth2_http",
          ":com_google_cloud_google_cloud_core",
          ":com_google_cloud_google_cloud_core_grpc",
          ":com_google_code_findbugs_jsr305",
          ":com_google_code_gson_gson",
          ":com_google_errorprone_error_prone_annotations",
          ":com_google_guava_guava",
          ":com_google_protobuf_protobuf_java",
          ":com_google_protobuf_protobuf_java_util",
          ":io_grpc_grpc_auth",
          ":io_grpc_grpc_context",
          ":io_grpc_grpc_core",
          ":io_grpc_grpc_netty_shaded",
          ":io_grpc_grpc_protobuf",
          ":io_grpc_grpc_protobuf_lite",
          ":io_grpc_grpc_stub",
          ":io_opencensus_opencensus_api",
          ":io_opencensus_opencensus_contrib_grpc_metrics",
          ":org_threeten_threetenbp",
      ],
  )


  native.java_library(
      name = "com_google_api_grpc_proto_google_cloud_texttospeech_v1beta1",
      visibility = ["//visibility:public"],
      exports = ["@com_google_api_grpc_proto_google_cloud_texttospeech_v1beta1//jar"],
      runtime_deps = [
          ":com_google_api_api_common",
          ":com_google_api_grpc_proto_google_common_protos",
          ":com_google_protobuf_protobuf_java",
      ],
  )


  native.java_library(
      name = "commons_logging_commons_logging",
      visibility = ["//visibility:public"],
      exports = ["@commons_logging_commons_logging//jar"],
  )


  native.java_library(
      name = "org_hamcrest_hamcrest_core",
      visibility = ["//visibility:public"],
      exports = ["@org_hamcrest_hamcrest_core//jar"],
  )


  native.java_library(
      name = "com_google_code_gson_gson",
      visibility = ["//visibility:public"],
      exports = ["@com_google_code_gson_gson//jar"],
  )


  native.java_library(
      name = "javax_inject_javax_inject",
      visibility = ["//visibility:public"],
      exports = ["@javax_inject_javax_inject//jar"],
  )


  native.java_library(
      name = "com_google_http_client_google_http_client",
      visibility = ["//visibility:public"],
      exports = ["@com_google_http_client_google_http_client//jar"],
      runtime_deps = [
          ":commons_codec_commons_codec",
          ":commons_logging_commons_logging",
          ":org_apache_httpcomponents_httpclient",
          ":org_apache_httpcomponents_httpcore",
      ],
  )


  native.java_library(
      name = "org_apache_httpcomponents_httpclient",
      visibility = ["//visibility:public"],
      exports = ["@org_apache_httpcomponents_httpclient//jar"],
      runtime_deps = [
          ":commons_codec_commons_codec",
          ":commons_logging_commons_logging",
          ":org_apache_httpcomponents_httpcore",
      ],
  )


  native.java_library(
      name = "com_google_api_grpc_proto_google_iam_v1",
      visibility = ["//visibility:public"],
      exports = ["@com_google_api_grpc_proto_google_iam_v1//jar"],
      runtime_deps = [
          ":com_google_api_api_common",
          ":com_google_api_grpc_proto_google_common_protos",
          ":com_google_protobuf_protobuf_java",
      ],
  )


  native.java_library(
      name = "com_google_http_client_google_http_client_jackson2",
      visibility = ["//visibility:public"],
      exports = ["@com_google_http_client_google_http_client_jackson2//jar"],
      runtime_deps = [
          ":com_fasterxml_jackson_core_jackson_core",
          ":com_google_http_client_google_http_client",
      ],
  )


  native.java_library(
      name = "io_grpc_grpc_context",
      visibility = ["//visibility:public"],
      exports = ["@io_grpc_grpc_context//jar"],
  )


  native.java_library(
      name = "com_google_api_gax_grpc",
      visibility = ["//visibility:public"],
      exports = ["@com_google_api_gax_grpc//jar"],
      runtime_deps = [
          ":com_google_api_api_common",
          ":com_google_api_gax",
          ":com_google_api_grpc_proto_google_common_protos",
          ":com_google_auth_google_auth_library_credentials",
          ":com_google_auth_google_auth_library_oauth2_http",
          ":com_google_code_findbugs_jsr305",
          ":com_google_guava_guava",
          ":io_grpc_grpc_auth",
          ":io_grpc_grpc_protobuf",
          ":io_grpc_grpc_stub",
          ":org_threeten_threetenbp",
      ],
  )


  native.java_library(
      name = "com_google_api_grpc_proto_google_common_protos",
      visibility = ["//visibility:public"],
      exports = ["@com_google_api_grpc_proto_google_common_protos//jar"],
      runtime_deps = [
          ":com_google_protobuf_protobuf_java",
      ],
  )


  native.java_library(
      name = "com_google_guava_guava",
      visibility = ["//visibility:public"],
      exports = ["@com_google_guava_guava//jar"],
  )


  native.java_library(
      name = "com_beust_jcommander",
      visibility = ["//visibility:public"],
      exports = ["@com_beust_jcommander//jar"],
  )


  native.java_library(
      name = "com_google_cloud_google_cloud_core",
      visibility = ["//visibility:public"],
      exports = ["@com_google_cloud_google_cloud_core//jar"],
      runtime_deps = [
          ":com_fasterxml_jackson_core_jackson_core",
          ":com_google_api_api_common",
          ":com_google_api_gax",
          ":com_google_api_grpc_proto_google_common_protos",
          ":com_google_api_grpc_proto_google_iam_v1",
          ":com_google_auth_google_auth_library_credentials",
          ":com_google_auth_google_auth_library_oauth2_http",
          ":com_google_code_findbugs_jsr305",
          ":com_google_code_gson_gson",
          ":com_google_guava_guava",
          ":com_google_http_client_google_http_client",
          ":com_google_http_client_google_http_client_jackson2",
          ":com_google_protobuf_protobuf_java",
          ":com_google_protobuf_protobuf_java_util",
          ":commons_codec_commons_codec",
          ":commons_logging_commons_logging",
          ":joda_time_joda_time",
          ":org_apache_httpcomponents_httpclient",
          ":org_apache_httpcomponents_httpcore",
          ":org_threeten_threetenbp",
      ],
  )


  native.java_library(
      name = "io_grpc_grpc_auth",
      visibility = ["//visibility:public"],
      exports = ["@io_grpc_grpc_auth//jar"],
      runtime_deps = [
          ":com_google_auth_google_auth_library_credentials",
          ":io_grpc_grpc_core",
      ],
  )


  native.java_library(
      name = "com_google_api_gax",
      visibility = ["//visibility:public"],
      exports = ["@com_google_api_gax//jar"],
      runtime_deps = [
          ":com_fasterxml_jackson_core_jackson_core",
          ":com_google_api_api_common",
          ":com_google_auth_google_auth_library_credentials",
          ":com_google_auth_google_auth_library_oauth2_http",
          ":com_google_code_findbugs_jsr305",
          ":com_google_guava_guava",
          ":com_google_http_client_google_http_client",
          ":com_google_http_client_google_http_client_jackson2",
          ":org_threeten_threetenbp",
      ],
  )


  native.java_library(
      name = "com_fasterxml_jackson_core_jackson_core",
      visibility = ["//visibility:public"],
      exports = ["@com_fasterxml_jackson_core_jackson_core//jar"],
  )


