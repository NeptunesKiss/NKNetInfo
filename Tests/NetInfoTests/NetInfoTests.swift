//
//  NetInfoTests.swift
//  NetInfo
//
//  Created by Travasoni Giuseppe on 26/08/16.
//
//

import XCTest

@testable import NetInfo

class NetInfoTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(NetInfo().text, "Hello, World!")
    }


    static var allTests : [(String, (NetInfoTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
