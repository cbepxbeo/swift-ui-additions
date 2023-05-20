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
        .package(url: "https://github.com/cbepxbeo/swift-ui-extensions.git", branch: "main")
    ],
    targets: [
        .target(
            name: "SwiftUIAdditions",
            dependencies: [
                .product(name: "SwiftUIExtension", package: "swift-ui-extensions")
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
