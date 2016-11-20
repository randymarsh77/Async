import PackageDescription

let package = Package(
    name: "Async",
    dependencies: [
		.Package(url: "https://github.com/randymarsh77/casync", majorVersion: 1),
	]
)
