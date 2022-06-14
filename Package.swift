// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "swiftRaylibtake3",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .executable(
            name: "swiftRaylibtake3",
            targets: ["swiftRaylibtake3"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(name: "Raylib", url: "https://github.com/STREGAsGate/Raylib.git", .branch("master"))//,
//        .package(name: "physac", path: "../../c/cpacks4Swift/physac")
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "swiftRaylibtake3",
            dependencies: ["Raylib"]),//, "physac"]),
        .testTarget(
            name: "swiftRaylibtake3Tests",
            dependencies: ["swiftRaylibtake3"]),
    ]
)