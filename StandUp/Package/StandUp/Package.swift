// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "StandUp",
  platforms: [
    .iOS(.v17),
    .macOS(.v14)
  ],
  products: [
    .library(
      name: "StandUpMac",
      targets: ["StandUpMac"]
    ),
  ],
  targets: [
    .target(
      name: "StandUpMac",
      dependencies: [
        "Shared"
      ]
    ),
    .target(name: "Shared")
  ]
)
