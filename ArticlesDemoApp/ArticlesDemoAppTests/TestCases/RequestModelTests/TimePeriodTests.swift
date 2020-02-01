//
//  RequestModelTests.swift
//  ArticlesDemoAppTests
//
//  Created by Waqas Sultan on 9/13/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import XCTest
@testable import ArticlesDemoApp
class TimePeriodTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    func testShouldReturnDayRawValue() {
        XCTAssertEqual(TimePeriod.Day.rawValue, "1")
    }
    
    func testShouldReturnNameArray() {
        XCTAssertTrue(TimePeriod.names.count > 0 )
    }
    
    func testShouldReturnNameDayAsString() {
        XCTAssertEqual(TimePeriod.Day.name, "Day")

    }
    
    func testShouldReturnNameWeekAsString() {
        XCTAssertEqual(TimePeriod.Week.name, "Week")
        
    }
    
    func testShouldReturnNameMonthAsString() {
        XCTAssertEqual(TimePeriod.Month.name, "Month")
        
    }

    

}
