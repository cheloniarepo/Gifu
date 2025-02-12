// swift-tools-version: 5.9

import PackageDescription

let package = Package(
  name: "Gifu",
  platforms: [
    .iOS(.v12),
    .tvOS(.v12),
    .visionOS(.v1),
  ],
  products: [
    .library(
      name: "Gifu",
      targets: ["Gifu"])
  ],
  dependencies: [],
  targets: [
    .target(
      name: "Gifu",
      dependencies: []
    )
  ]
)
