//
//  DemoApp.swift
//  Manifests
//
//  Created by Lili Shi on 10/8/24.
//

import ProjectDescription

enum DemoApp {
    static func makeAppTarget() -> Target {
        return .target(
            name: "DemoApp",
            destinations: [.iPhone],
            product: .app,
            bundleId: "\(bundleIDBase)",
            deploymentTargets: .iOS("16.0"),
            infoPlist: .extendingDefault(with: infoPlist),
            sources: ["CrashlyticsDemo/DemoApp/Sources/**"],
            resources: ["CrashlyticsDemo/DemoApp/Resources/**"],
            entitlements: .file(path: "ConfigurationFiles/Entitlements/DemoApp.entitlements"),
            scripts: [
                TargetScript.post(
                    path: "scripts/build-scripts/copy_firebase_plist.sh",
                    name: "Copy Firebase Plist",
                    outputPaths: ["${BUILT_PRODUCTS_DIR}/${PRODUCT_NAME}.app/GoogleService-Info.plist"]
                ),
                TargetScript.post(
                    path: "scripts/build-scripts/upload_crashlytics_dsyms.sh",
                    name: "Upload dSYMs to Firebase",
                    inputPaths: ["${DWARF_DSYM_FOLDER_PATH}/${DWARF_DSYM_FILE_NAME}"],
                    outputPaths: ["${DERIVED_FILE_DIR}/scripts/output.data"]
                )
            ],
            dependencies: [
                // Internal targets
                .target(name: "AppNavigation"),
            ],
            settings: .settings(configurations: [
                .debug(name: "Debug", xcconfig: "ConfigurationFiles/DemoApp.xcconfig"),
                .release(name: "Release", xcconfig: "ConfigurationFiles/DemoApp.xcconfig")
            ])
        )
    }

    static func makeReleaseScheme() -> Scheme {
        return .scheme(
            name: "DemoApp",
            buildAction: .buildAction(targets: [.target("DemoApp")]),
            runAction: .runAction(configuration: .release),
            archiveAction: .archiveAction(configuration: .release),
            analyzeAction: .analyzeAction(configuration: .release)
        )
    }

    static func makeDebugScheme() -> Scheme {
        return .scheme(
            name: "DemoApp-Debug",
            buildAction: .buildAction(targets: [.target("DemoApp")]),
            archiveAction: .archiveAction(configuration: .debug)
        )
    }

    private static var infoPlist: [String: ProjectDescription.Plist.Value] {
        [
            "UILaunchScreen": ["UIImageName": ""],
            "UIApplicationSceneManifest": [
                "UIApplicationSupportsMultipleScenes": false,
                "UISceneConfigurations": [
                    "UIWindowSceneSessionRoleApplication": [
                        [
                            "UISceneConfigurationName": "Default Configuration",
                            "UISceneDelegateClassName": "$(PRODUCT_MODULE_NAME).SceneDelegate"
                        ]
                    ]
                ]
            ],
            "CFBundleVersion": "$(CURRENT_PROJECT_VERSION)",
            "CFBundleShortVersionString": "$(MARKETING_VERSION)",
            "NSCameraUsageDescription": "We need access to your camera to capture media.",
            "NSMicrophoneUsageDescription": "We need access to your microphone to record audio.",
            "NSPhotoLibraryUsageDescription": "We need access to your photo library to select media."
        ]
    }
}
