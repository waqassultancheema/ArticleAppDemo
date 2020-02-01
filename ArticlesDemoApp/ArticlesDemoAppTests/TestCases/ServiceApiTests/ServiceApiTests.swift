//
//  ServiceApiTests.swift
//  ArticlesDemoAppTests
//
//  Created by Waqas Sultan on 9/12/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import XCTest
@testable import ArticlesDemoApp

class ServiceApiTests: XCTestCase {
    
    var sut:ServiceApi = ServiceApi()
    //var sutArticlesViewController:StubArticlesViewController?
    var jsonArticlessDictionaryStub : Dictionary<String,AnyObject>!
    let worker = ArticlesRemoteWorker()
    
    override func setUp() {
        super.setUp()
        jsonArticlessDictionaryStub = loadJSONDictionaryFromBundle(withName: "Articles", extension: "json")
        worker.serviceApi = sut
        sut.session = StubURLSession()
        
    }
    
    func testShouldReturnLoadedJSON() {
        XCTAssertNotNil(jsonArticlessDictionaryStub)
    }
    
    func testServiceNoInternetError() {
        DummyReachability.isConnected = false
        let session = sut.session as! StubURLSession
        session.nextData = nil
        let request = Request.Fetch.ArticleRequest(timePeriod: TimePeriod.Week)
        session.nextResponse = HTTPURLResponse(url: URL(string: request.mURL)!, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: nil)
        
        worker.fetchArticless(request: Request.Fetch.ArticleRequest(timePeriod: TimePeriod.Week), complete: { (article) in
            XCTFail()
        }, failure: { (error) in
            XCTAssertNotNil(error)
            
        })
    }
    
    func testServiceResumeCalled() {
        DummyReachability.isConnected = true
        
        worker.fetchArticless(request: Request.Fetch.ArticleRequest(timePeriod: TimePeriod.Week), complete: { (article) in
        }, failure: { (error) in
        })
        
        
        XCTAssertTrue((sut.task as! StubURLSessionDataTask).resumeWasCalled)
        
    }
    
    
    func testShouldReturnCorrectResult() {
        DummyReachability.isConnected = true
        
        let jsonString:String = jsonArticlessDictionaryStub.jsonStringRepresentation!
        let session = sut.session as! StubURLSession
        session.nextData = jsonString.data(using: .utf8)
        let request = Request.Fetch.ArticleRequest(timePeriod: TimePeriod.Week)
        session.nextResponse = HTTPURLResponse(url: URL(string: request.mURL)!, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: nil)
        
        worker.fetchArticless(request: Request.Fetch.ArticleRequest(timePeriod: TimePeriod.Week), complete: { (article) in
            XCTAssertNotNil(article)
        }, failure: { (error) in
            XCTFail()
        })
        
        
        
    }
    
    func testShouldReturnErrorOfNSURLErrorTimedOut() {
        DummyReachability.isConnected = true
        
        let jsonString:String = jsonArticlessDictionaryStub.jsonStringRepresentation!
        let session = sut.session as! StubURLSession
        session.nextData = jsonString.data(using: .utf8)
        let request = Request.Fetch.ArticleRequest(timePeriod: TimePeriod.Week)
        session.nextResponse = HTTPURLResponse(url: URL(string: request.mURL)!, statusCode: URLError.timedOut.rawValue , httpVersion: "HTTP/1.1", headerFields: nil)
        
        worker.fetchArticless(request: Request.Fetch.ArticleRequest(timePeriod: TimePeriod.Week), complete: { (article) in
            XCTFail()
        }, failure: { (error) in
            XCTAssertNotNil(error)

        })
        
        
        
    }
    
    
    func testShouldReturnErrorWithDataNil() {
        DummyReachability.isConnected = true
        
        let session = sut.session as! StubURLSession
        session.nextData = nil
        let request = Request.Fetch.ArticleRequest(timePeriod: TimePeriod.Week)
        session.nextResponse = HTTPURLResponse(url: URL(string: request.mURL)!, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: nil)
        
        worker.fetchArticless(request: Request.Fetch.ArticleRequest(timePeriod: TimePeriod.Week), complete: { (article) in
            XCTFail()
        }, failure: { (error) in
            XCTAssertNotNil(error)
            
        })
        
        
        
    }
    
    func testShouldReturnErrorOfCancelRequest() {
        DummyReachability.isConnected = true
        
        let session = sut.session as! StubURLSession
        session.nextData = nil
        let request = Request.Fetch.ArticleRequest(timePeriod: TimePeriod.Week)
        session.nextResponse = HTTPURLResponse(url: URL(string: request.mURL)!, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: nil)
        
       sut.task = sut.getDataFromServer(url: request.mURL, withMethod: .GET) { (value, error) in
            
        }
        sut.cancelRequest()
        
        XCTAssertEqual((sut.task as! StubURLSessionDataTask).cancelWasCalled, true)
        
        
    }
    
   
    
    
}
