// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: Constants.voodooADNName,
    platforms: [.iOS("15.0")],
    products: [
        .library(
            name: Constants.voodooADNName,
            targets: [Constants.voodooADNTargetName])
    ],
    targets: [
        // VoodooAdn loads OMSDK_Voodooio at launch, and a binary target cannot
        // declare a dependency: this target brings both into the app.
        .target(
            name: Constants.voodooADNTargetName,
            dependencies: [
                .target(name: Constants.voodooADNName),
                .target(name: Constants.OMSDKVoodooName)
            ],
            path: "Sources/\(Constants.voodooADNTargetName)"
        ),
        .binaryTarget(
            name: Constants.voodooADNName,
            url: Constants.voodooADNURL,
            checksum: Constants.voodooADNChecksum
        ),
        .binaryTarget(
            name: Constants.OMSDKVoodooName,
            url: Constants.OMSDKVoodooURL,
            checksum: Constants.OMSDKVoodooChecksum
        )
    ]
)

enum Constants {
    static var voodooADNURL: String { "https://framework.voodoo-adn.com/iOS/sdk/4.31.0/VoodooAdn.zip"}
    static var voodooADNChecksum: String { "1ee3f739a362435a032947b6c0313a9288043d08654fd995019af9dd2c9513e2" }
    static var voodooADNName: String { "VoodooAdn" }
    static var voodooADNTargetName: String { "VoodooAdnTarget" }
    static var OMSDKVoodooURL: String { "https://framework.voodoo-adn.com/omsdk/ios/1.6.9/OMSDK_Voodooio.zip"}
    static var OMSDKVoodooChecksum: String { "65d1c22f6e80e87d5ec38fdcfd0147e0dcae65ee571063d454a19a27b328a319" }
    static var OMSDKVoodooName: String { "OMSDK_Voodooio" }
}
