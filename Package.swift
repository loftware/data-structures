// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LoftDataStructures",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "LoftDataStructures",
            targets: ["LoftDataStructures"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        .package(
            name: "LoftDataStructures_Either",
            url: "git@github.com:loftware/either-type.git",
            .exact("0.0.1")),
        .package(
            name: "LoftDataStructures_ConcatenatedCollection",
            url: "git@github.com:loftware/concatenated-collection.git",
            .exact("0.0.1")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "LoftDataStructures",
            dependencies: [
                "LoftDataStructures_Either",
                "LoftDataStructures_ConcatenatedCollection"
            ]
        ),
        .testTarget(
            name: "LoftDataStructuresTests",
            dependencies: ["LoftDataStructures"]),
    ]
)
