// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "SingleLineShakeAnimation",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "SingleLineShakeAnimation",
            targets: ["SingleLineShakeAnimation"]
        )
    ],
    targets: [
        .target(
            name: "SingleLineShakeAnimation",
            path: ".",
            sources: [
                "UIView+Shake.swift",
                "ShakeModifier.swift"
            ],
            swiftSettings: [
                .define("SWIFT_PACKAGE")
            ]
        )
    ]
)
