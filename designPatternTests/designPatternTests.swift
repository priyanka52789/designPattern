//
//  designPatternTests.swift
//  designPatternTests
//
//  Created by Priyanka Sen on 04/03/19.
//  Copyright © 2019 Priyanka Sen. All rights reserved.
//

import XCTest
@testable import designPattern

class designPatternTests: XCTestCase {
    
    var userViewModel = UserViewModel()
    
    override func setUp() {
        super.setUp()
    }
    
    func testGetUserData() {
        userViewModel.getUserData {
            XCTAssertNil(self.userViewModel.userDateSouce)
        }
    }
    
}
