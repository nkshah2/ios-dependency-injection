import ProjectDescription

let project = Project(
    name: "IosDependencyInjection",
    targets: [
        .target(
            name: "IosDependencyInjection",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.tbx.IosDependencyInjection",
            sources: ["IosDependencyInjection/Sources/**"],
            dependencies: []
        )
    ]
)
