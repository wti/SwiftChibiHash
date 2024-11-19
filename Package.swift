// swift-tools-version:5.7

import PackageDescription

let swiftWrap = "ChibiHash"
let cLib = "\(swiftWrap)Lib"

let package = Package(
  name: "Swift\(swiftWrap)",
  products: [
    .library(name: swiftWrap, targets: [swiftWrap])
  ],
  targets: [
    .target(name: cLib),
    .target(
      name: swiftWrap,
      dependencies: [.target(name: cLib)]
    ),
    .testTarget(
      name: "\(swiftWrap)Tests",
      dependencies: [
        .target(name: swiftWrap)
      ]
    ),
    .testTarget(
      name: "\(cLib)Tests",
      dependencies: [
        .target(name: cLib)
      ]
    ),
  ]
)
