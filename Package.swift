// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "VaporAuth",
    dependencies: [
        // 💧 A server-side Swift web framework.
        .package(url: "https://github.com/vapor/vapor.git", from: "3.0.6"),

        // 🔵 Swift ORM (queries, models, relations, etc) built on SQLite 3.
        .package(url: "https://github.com/vapor/fluent-sqlite.git", from: "3.0.0-rc.4"),

        // Leaf package
        .package(url: "https://github.com/vapor/leaf.git", from: "3.0.0-rc.2"),

        // Auth Package
        .package(url: "https://github.com/vapor/auth.git", from: "2.0.0-rc.5"),

        // Crypto Package
        .package(url: "https://github.com/vapor/crypto.git", from: "3.2.0")
    ],
    targets: [
        .target(name: "App", dependencies: ["FluentSQLite",
                                            "Vapor",
                                            "Leaf",
                                            "Authentication",
                                            "Crypto"]
        ),

        .target(name: "Run", dependencies: ["App"]),
        .testTarget(name: "AppTests", dependencies: ["App"])
    ]
)
