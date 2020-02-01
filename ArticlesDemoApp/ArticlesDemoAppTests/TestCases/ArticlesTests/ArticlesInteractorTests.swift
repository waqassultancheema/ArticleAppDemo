//
//  ArticlesInteractorTests.swift
//  ArticlesDemoAppTests
//
//  Created by Waqas Sultan on 9/8/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import XCTest

@testable import ArticlesDemoApp

class ArticlesInteractorTests: XCTestCase {
    
    var sut:ArticlesInteractor?
    var stubRemoteWorker:StubArticlesRemoteWorker?
    var sutArticlesViewController:StubArticlesViewController?
    override func setUp() {
        super.setUp()
        sut = ArticlesInteractor()
        
        sutArticlesViewController = StubArticlesViewController()
        sutArticlesViewController?.configureTableViewDataSource()
      
        stubRemoteWorker = StubArticlesRemoteWorker()
        stubRemoteWorker?.dataToReturnOnSuccess = StubArticles.dummyArticle()

    }
    
    
    func testFetchArticlesShouldPresenterCalled() {
        
        
        
        let stubArticlesPresentation = StubArticlesPresenter()
        stubArticlesPresentation.output = sutArticlesViewController
        
        sut?.output = stubArticlesPresentation
        sut?.worker = stubRemoteWorker
        sut?.fetchArticles(timePeriod: TimePeriod.Week, searchString: "")
        
        XCTAssertTrue(stubArticlesPresentation.presentFetchedArticlesCalled, "")
    }
    
    func testFetchArticlesShouldAskPresenterToFormatResult() {
        
        
        
        let stubArticlesPresentation = StubArticlesPresenter()
        stubArticlesPresentation.output = sutArticlesViewController
        
        sut?.output = stubArticlesPresentation
        sut?.worker = stubRemoteWorker
        sut?.fetchArticles(timePeriod: TimePeriod.Week, searchString: "")
        let displayArticle = sutArticlesViewController?.tableViewDataSource.articles.first
        XCTAssertNotNil(displayArticle)
    }
    
    func testFetchArticlesShouldReturnError() {
        
        
        
        let stubArticlesPresentation = StubArticlesPresenter()
        stubArticlesPresentation.output = sutArticlesViewController
        stubRemoteWorker?.shouldFailOnFetch = true
        sut?.output = stubArticlesPresentation
        sut?.worker = stubRemoteWorker
          sutArticlesViewController?.viewDidLoad()
        sut?.fetchArticles(timePeriod: TimePeriod.Week, searchString: "")
        XCTAssertNotNil(sutArticlesViewController?.error)
    }
    
    func testFetchArticlesShouldReturnArticleWithSearchString() {
        
        
        
        let stubArticlesPresentation = StubArticlesPresenter()
        stubArticlesPresentation.output = sutArticlesViewController
        sut?.output = stubArticlesPresentation
        sut?.worker = stubRemoteWorker
        sut?.fetchArticles(timePeriod: TimePeriod.Week, searchString: "test")
        let displayArticle = sutArticlesViewController?.tableViewDataSource.articles.first
        XCTAssertNotNil(displayArticle)
    }
    
    func testFetchArticlesShouldReturnArticleWithDifferentTimePeriod() {
        
        
        
        let stubArticlesPresentation = StubArticlesPresenter()
        stubArticlesPresentation.output = sutArticlesViewController
        sut?.output = stubArticlesPresentation
        sut?.worker = stubRemoteWorker
        sut?.fetchArticles(timePeriod: TimePeriod.Day, searchString: "test")
        let displayArticle = sutArticlesViewController?.tableViewDataSource.articles.first
        XCTAssertNotNil(displayArticle)
    }
    
    func testFetchArticlesShouldReturnArticleWithWrongSearchString() {
        
        
        
        let stubArticlesPresentation = StubArticlesPresenter()
        stubArticlesPresentation.output = sutArticlesViewController
        sut?.output = stubArticlesPresentation
        sut?.worker = stubRemoteWorker
        sut?.fetchArticles(timePeriod: TimePeriod.Day, searchString: "test2")
        let displayArticle = sutArticlesViewController?.tableViewDataSource.articles.first
        XCTAssertNil(displayArticle)
    }
    

}
