//
//  ArticleDetailInteractorTests.swift
//  ArticlesDemoAppTests
//
//  Created by Waqas Sultan on 9/8/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import XCTest

@testable import ArticlesDemoApp

class ArticleDetailInteractorTests: XCTestCase {
    
    var sut:ArticleDetailInteractor?
    var sutArticleDetailViewController:StubArticleDetailViewController?
    override func setUp() {
        super.setUp()
        sut = ArticleDetailInteractor()
        
        sutArticleDetailViewController = StubArticleDetailViewController()
        sutArticleDetailViewController?.configureTableViewDataSource()

    }
    
    
    func testFetchArticleShouldPresenterCalled() {
        
        
        
        let stubArticleDetailPresentation = StubArticleDetailPresenter()
        stubArticleDetailPresentation.output = sutArticleDetailViewController
        
        sut?.output = stubArticleDetailPresentation
        sut?.getArticleDetail(article: StubArticle.dummyArticle())
        XCTAssertTrue(stubArticleDetailPresentation.presentFetchedArticlesCalled, "")
    }
    
    func testFetchArticleShouldAskPresenterToFormatResult() {
        
        
        
        let stubArticleDetailPresentation = StubArticleDetailPresenter()
        stubArticleDetailPresentation.output = sutArticleDetailViewController
        
        sut?.output = stubArticleDetailPresentation
        sut?.getArticleDetail(article: StubArticle.dummyArticle())

        let displayArticle = sutArticleDetailViewController?.tableViewDataSource.article
        XCTAssertNotNil(displayArticle?.title)
    }
    
    
    

}
