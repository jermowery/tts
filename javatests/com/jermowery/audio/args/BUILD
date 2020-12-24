java_library(
    name = "tests",
    srcs = glob(["*.java"]),
    deps = [
        "//java/com/jermowery/audio/args",
        "@maven//:com_google_guava_guava",
        "@maven//:com_google_truth_truth",
        "@maven//:junit_junit",
        "@maven//:org_mockito_mockito_all",
    ],
)

java_test(
    name = "ArgsModuleTest",
    size = "small",
    runtime_deps = [
        ":tests",
    ],
)
