// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "Dusk",
    platforms: [.macOS(.v10_10)],
    products: [
        .library(name: "Dusk", targets: ["Dusk"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "Dusk", dependencies: []),
        .testTarget(name: "DuskTests", dependencies: ["Dusk"]),
    ]
)
