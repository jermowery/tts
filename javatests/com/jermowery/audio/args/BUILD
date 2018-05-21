java_library(
    name = "tests",
    srcs = glob(["*.java"]),
    deps = [
        "//java/com/jermowery/audio/args",
        "//third_party:com_google_guava_guava",
        "//third_party:com_google_truth_truth",
        "//third_party:junit_junit",
        "//third_party:org_mockito_mockito_all",
    ],
)

java_test(
    name = "ArgsModuleTest",
    size = "small",
    runtime_deps = [
        ":tests",
    ],
)
