// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NetworkProvider",
    products: [
        .library(
            name: "NetworkProvider",
            targets: ["NetworkProvider"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "NetworkProvider",
            dependencies: []),
    ]
)
