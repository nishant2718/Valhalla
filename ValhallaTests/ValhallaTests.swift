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
        XCTAssertNoThrow(container.register(type: Service1.self, service: Service1()))
    }
    
    func testResolvesDependencySuccessfully() {
        container.register(type: Service1.self, service: Service1())
        
        let service = container.resolve(type: Service1.self)
        
        XCTAssertNotNil(service)
    }
    
    func testGracefulHandlingOfFailedResolution() {
        let unregisteredDependency = container.resolve(type: Service1.self)
        
        XCTAssertNil(unregisteredDependency)
    }

}
