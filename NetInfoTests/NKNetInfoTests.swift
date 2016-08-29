//
//  NetInfoTests.swift
//  NetInfoTests
//
//  Created by Travasoni Giuseppe on 26/08/16.
//
//

import XCTest
@testable import NKNetInfo

class NKNetInfoTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testInit() {
        let netInfo = NKNetInfo()
        print(netInfo.MACAddress)
    }
    
}
