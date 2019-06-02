// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "Dusk",
    platforms: [.macOS("10.10")],
    products: [
        .library(name: "Dusk", targets: ["Dusk"]),
    ],
    dependencies: [],
    targets: [
        .target(name: "Dusk", dependencies: [], path: "Dusk/"),
        .testTarget(name: "DuskTests", dependencies: ["Dusk"], path: "DuskTests/"),
    ]
)
