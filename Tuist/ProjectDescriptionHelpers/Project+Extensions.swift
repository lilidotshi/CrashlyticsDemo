//
//  Project+Extensions.swift
//  Manifests
//
//  Created by Lili Shi on 9/13/24.
//

import ProjectDescription

let bundleIDBase = "com.tuist.crashlytics"

public extension Project {
    init(name: String, settings: ProjectDescription.Settings, modules: [Module]) {
        let targetDeps = modules.map { module in
            TargetDependency.target(name: module.moduleName)
        }

        self.init(
            name: name,
            settings: settings,
            targets:
            // Old mojo app
            // [Mojo.makeMojoAppTarget(targetDependencies: targetDeps)] +
            // The fusion app
            [DemoApp.makeAppTarget()] +
            // All frameworks specified in modules
            modules.flatMap { $0.makeTarget() },
            schemes: [DemoApp.makeDebugScheme(), DemoApp.makeReleaseScheme()]
        )
    }
}
