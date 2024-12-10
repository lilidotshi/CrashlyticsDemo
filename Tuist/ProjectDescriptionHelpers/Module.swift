import ProjectDescription

public protocol Module {
    var moduleName: String { get }
    var dependencies: [ProjectDescription.TargetDependency] { get }
    var configurations: [Configuration] { get }
    var hasResources: Bool { get }
    var hasTests: Bool { get }
    var hasMocks: Bool { get }
}

public extension Module {
    func makeTarget() -> [Target] {
        let sources: [Path] = ["CrashlyticsDemo/\(moduleName)/Sources/**"] + (hasMocks ? ["CrashlyticsDemo/\(moduleName)/Mocks/**"] : [])

        var targets: [Target] = [
            .target(
                name: moduleName,
                destinations: [.iPhone],
                product: .framework,
                bundleId: "\(bundleIDBase)-\(moduleName)",
                deploymentTargets: .iOS("16.0"),
                sources: SourceFilesList.paths(sources),
                resources: hasResources ? ["CrashlyticsDemo/\(moduleName)/Resources/**"] : [],
                dependencies: dependencies,
                settings: .settings(configurations: configurations)
            )
        ]

        if hasTests {
            let sources: [Path] = ["CrashlyticsDemo/\(moduleName)/Tests/**"]
            targets.append(
                .target(
                    name: "\(moduleName)Tests",
                    destinations: .iOS,
                    product: .unitTests, bundleId: "\(bundleIDBase)-\(moduleName)Tests",
                    deploymentTargets: .iOS("16.0"),
                    sources: SourceFilesList.paths(sources),
                    dependencies: [
                        .target(name: moduleName)
                    ],
                    settings: .settings(configurations: configurations)
                )
            )
        }

        return targets
    }
}
