//
//  DependencyContainer.swift
//  Dip-clone
//
//  Created by Nishant Patel on 4/24/21.
//

/**
 `DependencyContainer` will allow you to do _Dependendency Injection_ by
 associating abstractions to concrete implementations.
 */
public class DependencyContainer {
    
    // Holds the list of registered dependencies.
    private var services = [ServiceKey: Any]()
    
    /**
     DependencyContainer initializer
     
     - Parameters:
        - setupBlock: All your register calls go here. If you reference your container in this block, be sure
     to use an unowned reference to avoid a retain cycle.
     
     */
    public init(setupBlock: (DependencyContainer) -> () = { _ in }) {
        setupBlock(self)
    }
    
    /// Register your service of type T. You can also associate it to a name - for times when you want different variations of the same dependency.
    /// - Parameters:
    ///   - type: The type of the service you're registering.
    ///   - name: A name to associate this factory with. This defaults to nil if none provided.
    ///   - service: The service instance to be stored, of `type`. This is used to resolve instances of `type`.
    public func register<T>(type: T.Type, name: String? = nil, service: Any) {
        let serviceKey = ServiceKey(type: type, name: name)
        services[serviceKey] = service
    }
    
    /// This will resolve to retrieve an instance of type T.
    /// - Parameters:
    ///   - type: Type of registered instance.
    ///   - name: Name given to registered instance.
    /// - Returns: Concrete instance of type T.
    public func resolve<T>(type: T.Type, name: String? = nil) -> T? {
        let serviceKey = ServiceKey(type: type, name: name)
        return services[serviceKey] as? T
    }
    
}
