# iOS Dependency Injection

This package is a simple implementation of dependency injection for Swift. You simple register classes for a specified key and can retrieve the resource from anywhere in your code.

## Installation

### Using SPM

This package can be used with Swift Package Manager normally using the GitHub URL: `https://github.com/nkshah2/ios-dependency-injection.git`

### Using Tuist

Edit your `Tuist/Package.swift`

```
import PackageDescription

#if TUIST
    import ProjectDescription

    let packageSettings = PackageSettings(
        productTypes: [
            "IosDependencyInjection": .framework
        ]
    )
#endif

let package = Package(
    name: "SwiftUIEngine",
    dependencies: [
        .package(url: "https://github.com/nkshah2/ios-dependency-injection.git", exact: "1.0.0") // You can also use "from" to specify a minimum version constraint instead
    ]
)
```

Edit your Project.swift

```
import ProjectDescription

let project = Project(
    ...
    targets: [
        .target(
            name: "MainTarget",
            ...
            dependencies: [
                .external(name: "IosDependencyInjection")
            ]
        ),
        ...
    ]
)
```

## Usage

### Register Dependencies

When registering dependencies you need to provide a type and a class that conforms to that type. Note that all registered dependencies are essentially treated as singletons.

```
DependencyContainer.register(type: NetworkManager.self, NetworkManager())
```

### Resolving Dependencies

You can then call either `resolve` or `unsafeResolve` to retrieve the dependency

```
let networkManager = DependencyContainer.resolve(NetworkManager.self)
let networkManager = DependencyContainer.unsafeResolve(NetworkManager.self)
```

Note that using `unsafeResolve` when the dependency is not registered will result in a crash.

You can also use our custom decorator to declare class variables as resolved dependencies

```
class MyClass {
  @Dependency var networkManager: NetworkManager
}
```
