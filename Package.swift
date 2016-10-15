import PackageDescription

let package = Package(
    name: "Async",
    targets: [
		Target(name: "Async"),
	],
    dependencies: [
		.Package(url: "https://www.github.com/randymarsh77/CAsync", majorVersion: 1),
	]
)
