java_binary(
    name = "audio",
    srcs = glob(["*.java"]),
    main_class = "com.jermowery.audio.CovertToAudioMain",
    visibility = ["//visibility:public"],
    deps = [
        "//java/com/jermowery/audio/args",
        "@maven//:com_beust_jcommander",
        "@maven//:com_google_api_api_common",
        "@maven//:com_google_api_gax",
        "@maven//:com_google_api_gax_grpc",
        "@maven//:com_google_api_grpc_proto_google_cloud_texttospeech_v1beta1",
        "@maven//:com_google_cloud_google_cloud_texttospeech",
        "@maven//:com_google_guava_guava",
        "@maven//:com_google_inject_guice",
        "@maven//:com_google_protobuf_protobuf_java",
    ],
)
