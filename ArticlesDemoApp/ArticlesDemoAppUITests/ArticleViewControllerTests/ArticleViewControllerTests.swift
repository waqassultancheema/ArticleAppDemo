//
//  ArticleViewControllerTests.swift
//  ArticlesDemoAppUITests
//
//  Created by Waqas Sultan on 9/13/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import XCTest

class ArticleViewControllerTests: XCTestCase {
    let app = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    func testShouldGoToArticleDetail() {
        sleep(5)
        app.tables.children(matching: .cell).element(boundBy: 0).tap()
    }
    
    func testSearch() {
        
        
        app.buttons["Button"].tap()
        
        app.tables.searchFields["Search Articles"].tap()
        app.tables.children(matching: .cell).element(boundBy: 0).tap()
    
    }
    
  
    
    
}

