// swift-tools-version: 5.8

import PackageDescription

let package = Package(
	name: "Dusk",
	platforms: [.macOS(.v10_13)],
	products: [
		.library(name: "Dusk", targets: ["Dusk"]),
	],
	dependencies: [],
	targets: [
		.target(name: "Dusk", dependencies: []),
		.testTarget(name: "DuskTests", dependencies: ["Dusk"]),
	]
)


let swiftSettings: [SwiftSetting] = [
	.enableExperimentalFeature("StrictConcurrency")
]

for target in package.targets {
	var settings = target.swiftSettings ?? []
	settings.append(contentsOf: swiftSettings)
	target.swiftSettings = settings
}
