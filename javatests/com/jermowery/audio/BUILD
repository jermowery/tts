java_library(
    name = "tests",
    srcs = glob(["*.java"]),
    data = [
        "test1.txt",
        "test2.txt",
    ],
    deps = [
        "//java/com/jermowery/audio",
        "@maven//:com_google_guava_guava",
        "@maven//:com_google_truth_truth",
        "@maven//:junit_junit",
    ],
)

java_test(
    name = "FromTextSsmlProviderTest",
    size = "small",
    runtime_deps = [
        ":tests",
    ],
)
