//
//  ValhallaTests.swift
//  ValhallaTests
//
//  Created by Nishant Patel on 4/24/21.
//

import XCTest
@testable import Valhalla

private protocol Service: AnyObject { }
private class Service1: Service { }
private class Service2: Service { }

class ValhallaTests: XCTestCase {
    
    let container = DependencyContainer()
    
    override func setUp() {
        super.setUp()
        container.reset()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testRegistersDependencySuccessfully() {
        XCTAssertNoThrow(container.register(type: Service.self, service: Service1()))
    }
    
    func testResolvesDependencySuccessfully() {
        container.register(type: Service.self, service: Service1())
        
        let service = container.resolve(type: Service.self)
        
        XCTAssertNotNil(service)
    }
    
    func testResolvesNamedDependencies() {
        container.register(type: Service.self, name: "serv", service: Service1())
        container.register(type: Service.self, name: "serv2", service: Service2())
        
        let serv = container.resolve(type: Service.self, name: "serv")
        let serv2 = container.resolve(type: Service.self, name: "serv2")
        
        XCTAssertNotNil(serv)
        XCTAssertNotNil(serv2)
    }
    
    func testGracefulHandlingOfFailedResolution() {
        let unregisteredDependency = container.resolve(type: Service1.self)
        
        XCTAssertNoThrow(unregisteredDependency)
        XCTAssertNil(unregisteredDependency)
    }

}
