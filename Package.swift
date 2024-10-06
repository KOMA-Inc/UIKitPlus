// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UIKitPlus",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "UIKitPlus",
            targets: ["UIKitPlus"]
        )
    ],
    targets: [
        .target(
            name: "UIKitPlus"
        ),
        .testTarget(
            name: "UIKitPlusTests",
            dependencies: ["UIKitPlus"]
        )
    ]
)
