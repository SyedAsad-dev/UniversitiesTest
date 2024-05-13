// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DetailModule",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "DetailModule",
            targets: ["DetailModule"]),
    ],
    dependencies: [
        .package(name: "Domain", path: "../Domain"),
        .package(name: "Utils", path: "../Utils"),
        .package(path: "../Common"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "DetailModule",
            dependencies: [
                .product(name: "Entities", package: "Domain"),
                .product(name: "Utils", package: "Utils"),
                .product(name: "DetailsViewDelegate", package: "Domain"),
                "Common",
//                .product(name: "ListServiceRepository", package: "Domain"),
            ],
            resources: [.process("Detail.storyboard")]
        ),
        .testTarget(
            name: "DetailModuleTests",
            dependencies: ["DetailModule"]),
    ]
)
