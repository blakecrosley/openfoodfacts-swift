// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "OpenFoodFactsSDK",
    defaultLocalization: "en",
    platforms: [
        // Keep iOS 14+ or iOS 15+ 
        .iOS(.v14),
        // Add macOS if you want to build on macOS
        .macOS(.v12)
    ],
    products: [
        .library(
            name: "OpenFoodFactsSDK",
            targets: ["OpenFoodFactsSDK"]
        )
    ],
    dependencies: [
        // Crop library for iOS only
        // We'll conditionally exclude for macOS in the target
        .package(url: "https://github.com/TimOliver/TOCropViewController.git", from: "2.6.0")
    ],
    targets: [
        .target(
            name: "OpenFoodFactsSDK",
            dependencies: [
                // Condition: Only link TOCropViewController on iOS
                .product(
                    name: "TOCropViewController",
                    package: "TOCropViewController",
                    condition: .when(platforms: [.iOS])
                )
            ],
            path: "Sources"
        )
    ]
)
