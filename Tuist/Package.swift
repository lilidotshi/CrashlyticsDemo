// swift-tools-version: 5.10
@preconcurrency import PackageDescription

#if TUIST
    import ProjectDescription

    let packageSettings = PackageSettings(
        // Customize the product types for specific package product
        // Default is .staticFramework
        // productTypes: ["Alamofire": .framework,]
    )
#endif

let package = Package(
    name: "CrashlyticsDemo",
    platforms: [
        .iOS(.v16)
    ],
    dependencies: []
)
