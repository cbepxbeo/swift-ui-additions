// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "SwiftUIAdditions",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "SwiftUIAdditions",
            targets: ["SwiftUIAdditions"]),
    ],
    targets: [
        .target(
            name: "SwiftUIAdditions",
            dependencies: [
            ],
            path: "Sources"
        ),
        .testTarget(
            name: "SwiftUIAdditionsTests",
            dependencies: ["SwiftUIAdditions"]
         ),
    ],
    swiftLanguageVersions: [ .version("5.1") ]
)
