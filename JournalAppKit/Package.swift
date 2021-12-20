// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "JournalAppKit",
    products: [
        .library(name: "JournalAppKit", targets: ["JournalAppKit"]),
        .library(name: "Models", targets: ["Models"]),
        .library(name: "DateHelpers", targets: ["DateHelpers"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .target(name: "JournalAppKit", dependencies: []),
        .target(name: "Models"),
        .target(name: "DateHelpers"),
        .testTarget(
            name: "DateHelpersTests",
            dependencies: ["DateHelpers"]),
        .testTarget(
            name: "JournalAppKitTests",
            dependencies: ["JournalAppKit"])
        
    ]
)
