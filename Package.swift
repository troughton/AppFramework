// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AppFramework",
    platforms: [.macOS(.v10_14)],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "AppFramework",
            targets: ["AppFramework"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/troughton/SwiftFrameGraph", from: "2.6.0"),
        .package(url: "https://github.com/troughton/SwiftMath", from: "4.0.0"),
        .package(url: "https://github.com/troughton/SwiftImGui", from: "1.7.32"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .systemLibrary(
            name: "CSDL2",
            pkgConfig: "sdl2",
            providers: [
                .brew(["sdl2"]),
                .apt(["sdl2"]),
            ]
        ),
        .target(name: "CNativeFileDialog"),
        .target(
            name: "AppFramework",
            dependencies: ["FrameGraphUtilities", "SwiftFrameGraph", "SwiftMath", "ImGui", "CSDL2", "CNativeFileDialog"]),
    ]
)
