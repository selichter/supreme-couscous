// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "JournalAppKit",
    platforms: [
      .iOS(.v14)
    ],
    products: [
        .library(name: "JournalAppKit", targets: ["JournalAppKit"]),
        .library(name: "Models", targets: ["Models"]),
        .library(name: "DateHelpers", targets: ["DateHelpers"]),
        .library(name: "PromptsCore", targets: ["PromptsCore"]),
        .library(name: "AppStateCore", targets: ["AppStateCore"]),
        .library(name: "EntriesCore", targets: ["EntriesCore"]),
        .library(name: "Styleguide", targets: ["Styleguide"]),
        .library(name: "CategoriesCore", targets: ["CategoriesCore"])
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture.git", from: "0.9.0"),
    ],
    targets: [
        .target(name: "Models"),
        .target(name: "Styleguide"),
        .target(name: "JournalAppKit"),
        .testTarget(
            name: "JournalAppKitTests",
            dependencies: ["JournalAppKit"]),
        
        .target(name: "DateHelpers"),
        .testTarget(
            name: "DateHelpersTests",
            dependencies: ["DateHelpers"]),
        
        .target(name: "PromptsCore",
                dependencies: ["Models",
                                .product(name: "ComposableArchitecture",
                                         package: "swift-composable-architecture")]),
        .testTarget(
            name: "PromptsCoreTests",
            dependencies: ["PromptsCore", "AppStateCore"]),
        
        .target(name: "AppStateCore",
                dependencies: ["Models",
                               "PromptsCore",
                               "EntriesCore",
                               "CategoriesCore",
                                .product(name: "ComposableArchitecture",
                                         package: "swift-composable-architecture")]),
    
        .target(name: "EntriesCore",
                dependencies: ["Models",
                                .product(name: "ComposableArchitecture",
                                         package: "swift-composable-architecture")]),
        .testTarget(
            name: "EntriesCoreTests",
            dependencies: ["EntriesCore", "AppStateCore"]),
        .target(name: "CategoriesCore",
                dependencies: ["Models",
                                .product(name: "ComposableArchitecture",
                                         package: "swift-composable-architecture")]),
        .testTarget(
            name: "CategoriesCoreTests",
            dependencies: ["CategoriesCore", "AppStateCore"]),
    ]
)
