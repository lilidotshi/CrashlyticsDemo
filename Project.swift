import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
    name: "CrashlyticsDemo",
    settings:
    .settings(configurations: [
        .debug(name: "Debug", xcconfig: "ConfigurationFiles/Demo.xcconfig"),
        .release(name: "Release", xcconfig: "ConfigurationFiles/Demo.xcconfig")
    ],
    defaultSettings: .recommended(excluding: ["DEBUG_INFORMATION_FORMAT"])),
    modules: [
        AppNavigationModule(),
    ]
)
