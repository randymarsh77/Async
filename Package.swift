import PackageDescription

let package = Package(
    name: "Async",
    dependencies: [
		.Package(url: "https://www.github.com/randymarsh77/casync", majorVersion: 1),
	]
)
