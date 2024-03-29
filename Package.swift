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
    dependencies: [
        .package(url: "https://github.com/cbepxbeo/swift-ui-extensions.git", from: "0.0.2"),
        .package(url: "https://github.com/cbepxbeo/swift-utilities.git", from: "0.0.4"),
    ],
    targets: [
        .target(
            name: "SwiftUIAdditions",
            dependencies: [
                .product(name: "SwiftUIExtension", package: "swift-ui-extensions"),
                .product(name: "SwiftUtilities", package: "swift-utilities"),
            ],
            path: "Sources"
        ),
        .testTarget(
            name: "SwiftUIAdditionsTests",
            dependencies: ["SwiftUIAdditions"]
         ),
    ],
    swiftLanguageVersions: [ .version("5.9") ]
)
