//
//  MVVMTests.swift
//  MVVMTests
//
//  Created by Apple on 17/02/20.
//  Copyright © 2020 assetvault. All rights reserved.
//

import XCTest
@testable import MVVM

class MVVMTests: XCTestCase {
    
    var loginViewModel = LoginViewModel()

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    func test_email() {
        let flag = loginViewModel.validateEmail("kuldeepnith.cse@gmail.com")
        XCTAssert(flag)
    }
    
    func test_email1() {
        let flag = loginViewModel.validateEmail("kuldeepnith")
        XCTAssert(!flag)
       }
    

    

}
