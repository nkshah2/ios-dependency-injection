import ProjectDescription

let project = Project(
    name: "IosDependencyInjection",
    targets: [
        .target(
            name: "IosDependencyInjection",
            destinations: .iOS,
            product: .framework,
            bundleId: "com.tbx.IosDependencyInjection",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchStoryboardName": "LaunchScreen.storyboard",
                ]
            ),
            sources: ["IosDependencyInjection/Sources/**"],
            resources: ["IosDependencyInjection/Resources/**"],
            dependencies: []
        ),
        .target(
            name: "IosDependencyInjectionTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "com.tbx.IosDependencyInjectionTests",
            infoPlist: .default,
            sources: ["IosDependencyInjection/Tests/**"],
            resources: [],
            dependencies: [.target(name: "IosDependencyInjection")]
        ),
    ]
)
