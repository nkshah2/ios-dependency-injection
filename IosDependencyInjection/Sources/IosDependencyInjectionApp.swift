import Foundation

public class DependencyContainer {
    private static var factories: [String: () -> Any] = [:]
    private static var cache: [String: Any] = [:]
    
    public static func register<Service>(type: Service.Type, _ factory: @autoclosure @escaping () -> Service) {
        if !factories.contains(where: {
            key, _ in
            
            return key == String(describing: type.self)
        }) {
            factories[String(describing: type.self)] = factory
        }
    }
    
    public static func resolve<Service>(_ type: Service.Type) -> Service? {
        let serviceName = String(describing: type.self)
        
        if let service = cache[serviceName] as? Service {
            return service
        } else if !factories.contains(where: {
            key, _ in
            
            return key == serviceName
        }) {
            return nil
        } else {
            let service = factories[serviceName]?() as? Service

            if let service = service {
                cache[serviceName] = service
            }

            return service
        }
    }
    
    public static func unsafeResolve<Service>(_ type: Service.Type) -> Service {
        let serviceName = String(describing: type.self)
        let service = resolve(type)
        
        if service == nil {
            fatalError("No dependency found for \(serviceName)")
        }
        
        return service!
    }
}

@propertyWrapper
public struct Dependency<ServiceType> {

    public var service: ServiceType

    public init() {
        let service = DependencyContainer.unsafeResolve(ServiceType.self)
        self.service = service
    }

    public var wrappedValue: ServiceType {
        get { self.service }
        mutating set { service = newValue }
    }
}
