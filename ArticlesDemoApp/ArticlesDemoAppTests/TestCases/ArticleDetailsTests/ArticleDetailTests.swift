//
//  ArticleDetailTests.swift
//  ArticlesDemoAppTests
//
//  Created by Waqas Sultan on 9/8/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import XCTest
@testable import ArticlesDemoApp

class ArticleDetailTests: XCTestCase {

    var jsonArticleDictionaryStub : Dictionary<String,AnyObject>!

    override func setUp() {
        super.setUp()
        jsonArticleDictionaryStub = loadJSONDictionaryFromBundle(withName: "Article", extension: "json")
    }

//    override func tearDown() {
//
//    }
    
    func testShouldReturnLoadedJSON() {
        XCTAssertNotNil(jsonArticleDictionaryStub)
    }
    
    
    
    func testShouldCreateArticleFromDictionary()  {
        if  let firstArticleJson = jsonArticleDictionaryStub {
        do {
            let article = try Article(firstArticleJson)
             XCTAssertNotNil(article)
        } catch {
            XCTFail("Problem in Parsing of Dictioanry")
        }
        }

    }
    func testShouldGetId() {
        if  let firstArticleJson = jsonArticleDictionaryStub {
            do {
                let article = try Article(firstArticleJson)
                XCTAssertNotNil(article.id)
            } catch {
                XCTFail("Problem in Parsing of Dictioanry")
            }
        }
        

    }

    func testShouldGetName() {
        if  let firstArticleJson = jsonArticleDictionaryStub {
            do {
                let article = try Article(firstArticleJson)
                XCTAssertNotNil(article.title)
            } catch {
                XCTFail("Problem in Parsing of Dictioanry")
            }
        }
       

    }

    func testShouldGetPublishedDate() {
        
        if  let firstArticleJson = jsonArticleDictionaryStub {
            do {
                let article = try Article(firstArticleJson)
                XCTAssertNotNil(article.publishedDate)
            } catch {
                XCTFail("Problem in Parsing of Dictioanry")
            }
        }
       

    }

    func testShouldGetSource() {
        if  let firstArticleJson = jsonArticleDictionaryStub {
            do {
                let article = try Article(firstArticleJson)
                XCTAssertNotNil(article.source)
            } catch {
                XCTFail("Problem in Parsing of Dictioanry")
            }
        }

    }
    
    func testShouldGetMedia() {
        if  let firstArticleJson = jsonArticleDictionaryStub {
            do {
                let article = try Article(firstArticleJson)
                XCTAssertNotNil(article.media)
            } catch {
                XCTFail("Problem in Parsing of Dictioanry")
            }
        }
    }
    
    func testShouldGetAdxKeywords() {
        if  let firstArticleJson = jsonArticleDictionaryStub {
            do {
                let article = try Article(firstArticleJson)
                XCTAssertNotNil(article.adxKeywords)
            } catch {
                XCTFail("Problem in Parsing of Dictioanry")
            }
        }
    }
    

    
    
    

}
