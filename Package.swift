// swift-tools-version:5.1
import PackageDescription

let package = Package(
	name: "Async",
	products: [
		.library(
			name: "Async",
			targets: ["Async"]
		),
	],
	dependencies: [
		.package(url: "https://github.com/randymarsh77/casync", .branch("master")),
	],
	targets: [
		.target(
			name: "Async",
			dependencies: ["CAsync"]
		),
	]
)
