//
//  ArticlesTests.swift
//  ArticlesDemoAppTests
//
//  Created by Waqas Sultan on 9/8/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import XCTest
@testable import ArticlesDemoApp

class ArticlesTests: XCTestCase {

    var jsonArticlessDictionaryStub : Dictionary<String,AnyObject>!

    override func setUp() {
        super.setUp()
        jsonArticlessDictionaryStub = loadJSONDictionaryFromBundle(withName: "Articles", extension: "json")
    }

//    override func tearDown() {
//
//    }
    
    func testShouldReturnLoadedJSON() {
        XCTAssertNotNil(jsonArticlessDictionaryStub)
    }
    
    
    
    func testShouldCreateArticlesFromDictionary()  {
        let firstArticlesJson = jsonArticlessDictionaryStub
        do {
             let articles = try Articles(firstArticlesJson!)
             XCTAssertNotNil(articles)
        } catch {
            XCTFail("Problem in Parsing of Dictioanry")
        }
       
        
    }
    
    
    func testShouldGetCopyRight() {
        let firstArticlesJson = jsonArticlessDictionaryStub
        do {
            let articles = try Articles(firstArticlesJson!)
            XCTAssertNotNil(articles.copyright)
        } catch {
            XCTFail("Problem in Parsing of Dictioanry")
        }
        
    }
    
    func testShouldGetResults() {
        let firstArticlesJson = jsonArticlessDictionaryStub
        do {
            let articles = try Articles(firstArticlesJson!)
            XCTAssertNotNil(articles.results)
        } catch {
            XCTFail("Problem in Parsing of Dictioanry")
        }
        
    }
    
    
    
    
    func testUserIdShouldBePositiveNumber() {
       // let Articles =  Articles(userID: 0, id: 0, title: "", body: "")
       // XCTAssertGreaterThanOrEqual(Articles.userID, 0)
    }
    
    func testUserIdShouldBeGreaterThanZero() {
       // let Articles =  Articles(userID: 1, id: 1, title: "", body: "")
       // XCTAssertGreaterThanOrEqual(Articles.userID, 1)
    }
    
    func testIdShouldBeGreaterThanZero() {
       // let Articles =  Articles(userID: 1, id: 1, title: "", body: "")
       // XCTAssertGreaterThanOrEqual(Articles.id, 1)
    }
    
    func testIdShouldBePositiveNumber() {
       // let Articles =  Articles(userID: 0, id: 0, title: "", body: "")
      //  XCTAssertGreaterThanOrEqual(Articles.id, 0)
    }
    
    
    
    
    

    

}
