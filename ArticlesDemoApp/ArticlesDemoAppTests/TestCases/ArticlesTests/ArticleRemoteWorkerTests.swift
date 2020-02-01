//
//  ArticleRemoteWorkerTests.swift
//  ArticlesDemoAppTests
//
//  Created by Waqas Sultan on 9/12/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import XCTest
@testable import ArticlesDemoApp

class ArticleRemoteWorkerTests: XCTestCase {
    
    var sut:ArticlesRemoteWorker?
    //var sutArticlesViewController:StubArticlesViewController?
    var jsonArticlessDictionaryStub : Dictionary<String,AnyObject>!
    var stubSerivceApi:StubServiceApi = StubServiceApi()
    override func setUp() {
        super.setUp()
        jsonArticlessDictionaryStub = loadJSONDictionaryFromBundle(withName: "Articles", extension: "json")

        sut = ArticlesRemoteWorker()
        stubSerivceApi.session = StubURLSession()
        sut?.serviceApi = stubSerivceApi
        

    }
    
    func testShouldReturnLoadedJSON() {
        XCTAssertNotNil(jsonArticlessDictionaryStub)
    }
    
   

    
    func testShouldReturnArticles() {
        DummyReachability.isConnected = true

        let jsonString:String = jsonArticlessDictionaryStub.jsonStringRepresentation!
         let session = stubSerivceApi.session as! StubURLSession
            session.nextData = jsonString.data(using: .utf8)
            let request = Request.Fetch.ArticleRequest(timePeriod: TimePeriod.Week)
            session.nextResponse = HTTPURLResponse(url: URL(string: request.mURL)!, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: nil)
            sut?.fetchArticless(request: Request.Fetch.ArticleRequest(timePeriod: TimePeriod.Week), complete: { (article) in
                XCTAssertNotNil(article)
            }, failure: { (error) in
                XCTFail()
            })
        

    }
    
    func testShouldReturnErrorOfMappingArticles() {
        DummyReachability.isConnected = true
        let session = stubSerivceApi.session as! StubURLSession

        session.nextData = "".data(using: .utf8)
        let request = Request.Fetch.ArticleRequest(timePeriod: TimePeriod.Week)
        session.nextResponse = HTTPURLResponse(url: URL(string: request.mURL)!, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: nil)
        sut?.fetchArticless(request: Request.Fetch.ArticleRequest(timePeriod: TimePeriod.Week), complete: { (article) in
            XCTFail()

        }, failure: { (error) in
            XCTAssertEqual(error, "The data couldn’t be read because it isn’t in the correct format.")

        })
        
    }
}
