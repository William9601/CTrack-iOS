// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Modules",
    platforms: [.iOS(.v15)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Root",
            targets: ["Root"]
        ),
    ],
    dependencies: [
        .package(name: "Common", path: "../Common")
    ],
    targets: [
        .target(name: "Root", dependencies: [ "Scenes" ]),
        .target(name: "Scenes", 
                dependencies: [
                    .product(name: "Components", package: "Common"),
                    .product(name: "Models", package: "Common"),
                    .product(name: "Services", package: "Common")
                ]),
        .testTarget(name: "ScenesTests", dependencies: ["Scenes"])
    ]
)
