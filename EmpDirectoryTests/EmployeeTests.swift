//
//  EmployeeTests.swift
//  EmpDirectoryTests
//
//  Created by Chanchal Raj on 17/02/2019.
//  Copyright © 2019 Chanchal Raj. All rights reserved.
//

import XCTest
@testable import EmpDirectory
class EmployeeTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCurrencyFormat() {
        let mockEmployee = Employee.init(name: "Test", birthYear: 2011)
        let formattedSalary = mockEmployee.formattedSalary()
        XCTAssertEqual(formattedSalary, "$1,000.00")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
