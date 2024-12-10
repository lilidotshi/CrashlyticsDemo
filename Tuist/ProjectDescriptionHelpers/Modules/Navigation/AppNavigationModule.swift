//
//  AppNavigationModule.swift
//  Manifests
//
//  Created by Lili Shi on 9/30/24.
//

import ProjectDescription

public struct AppNavigationModule: Module {
    public let moduleName = "AppNavigation"
    public let dependencies: [TargetDependency] = []
    public let configurations: [Configuration] = []
    public let hasResources = true
    public var hasTests = false
    public var hasMocks = false

    public init() {}
}
