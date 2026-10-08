// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "open_wearables_health_sdk",
    platforms: [.iOS("15.0")],
    products: [
        .library(name: "open-wearables-health-sdk", targets: ["open_wearables_health_sdk"]),
    ],
    dependencies: [
        .package(name: "FlutterFramework", path: "../FlutterFramework"),
        // dial203 fork: HRV RMSSD and readiness input types. Pinned to a commit so
        // every build maps to one SDK revision.
        .package(
            url: "https://github.com/dial203/dial203-open_wearables_ios_sdk.git",
            revision: "bc6817ccdd4b56231b18600ad5af03d5b4c03cce"
        ),
    ],
    targets: [
        .target(
            name: "open_wearables_health_sdk",
            dependencies: [
                .product(name: "FlutterFramework", package: "FlutterFramework"),
                .product(name: "OpenWearablesHealthSDK", package: "dial203-open_wearables_ios_sdk"),
            ],
            resources: [.process("Resources")],
        ),
    ]
)
