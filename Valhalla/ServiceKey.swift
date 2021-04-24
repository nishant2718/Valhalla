//
//  ServiceKey.swift
//  Dip-clone
//
//  Created by Nishant Patel on 4/24/21.
//

import Foundation

/// A key used to store services in a container
public struct ServiceKey: Hashable, CustomStringConvertible {
    
    public let type: Any.Type
    public var name: String?
    
    init(type: Any.Type, name: String? = nil) {
        self.type = type
        self.name = name
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(ObjectIdentifier(type))
        hasher.combine(name)
    }
    
    public static func == (lhs: ServiceKey, rhs: ServiceKey) -> Bool {
        lhs.type == rhs.type && lhs.name == rhs.name
    }
    
    public var description: String {
        return "type: \(String(reflecting: type)), name: \(name ?? "N/A")"
    }
    
}
