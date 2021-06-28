// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "TimeAnimator",
    platforms: [.iOS(.v12), .macOS(.v10_13)],
    products: [
        .library(
            name: "TimeAnimator",
            targets: ["TimeAnimator"]),
    ],
    dependencies: [
        .package(url: "https://github.com/eonist/SimpleTimer.git", .branch("master"))
    ],
    targets: [
        .target(
            name: "TimeAnimator",
            dependencies: ["SimpleTimer"])
    ]
)
