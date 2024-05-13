// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Domain",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Entities",
            targets: ["Entities"]
        ),
        .library(
            name: "DetailsViewDelegate",
            targets: ["DetailsViewDelegate"]
        ),
//        .library(
//            name: "ListServiceRepository",
//            targets: ["ListServiceRepository"]
//        ),
        .library(
            name: "Protocols",
            targets: ["Protocols"]
        ),
        
    ],
//    dependencies: [
//        .package(name: "Data", path: "../Data"),
//    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Entities",
            dependencies: []
        ),
        .target(
            name: "Protocols",
            dependencies: ["Entities"]
        ),
        .target(
            name: "DetailsViewDelegate",
            dependencies: []
        ),
        
//        .target(
//            name: "CoreDataRepository",
//            dependencies: [
//                "Entities",
//                "Protocols",
////                .product(name: "Data", package: "Data"),
//            ]
//        ),
//        .target(
//            name: "ListServiceRepository",
//            dependencies: [
//                "Entities",
//                "Protocols",
////                .product(name: "Data", package: "Data"),
//            ]
//        ),
        .testTarget(
            name: "DomainTests",
            dependencies: []),
    ]
)
