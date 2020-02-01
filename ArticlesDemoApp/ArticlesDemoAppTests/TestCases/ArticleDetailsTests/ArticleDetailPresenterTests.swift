//
//  ArticleDetailPresenterTests.swift
//  ArticlesDemoAppTests
//
//  Created by Waqas Sultan on 9/8/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import XCTest

@testable import ArticlesDemoApp

class ArticleDetailPresenterTests: XCTestCase {

    var stubArticle:StubArticle?
    var sutPres:ArticleDetailPresenter?

    override func setUp() {
        super.setUp()
        stubArticle = StubArticle.dummyArticle()
        sutPres = ArticleDetailPresenter()
    }


    func testPresenterShouldFormatArticleForDisplay() {

        let stubArticleDetailViewController:StubArticleDetailViewController = StubArticleDetailViewController()
        stubArticleDetailViewController.configureTableViewDataSource()
        sutPres?.output = stubArticleDetailViewController
        sutPres?.presentFetchArticleDetail(article: stubArticle!)
        let displayArticle = stubArticleDetailViewController.tableViewDataSource.article
        XCTAssertNotEqual(displayArticle.title, "")
    }
    
    func testPresenterShouldFormatMediaWithJumboFormat() {
        
        let stubArticleDetailViewController:StubArticleDetailViewController = StubArticleDetailViewController()
        stubArticleDetailViewController.configureTableViewDataSource()
        sutPres?.output = stubArticleDetailViewController
        sutPres?.presentFetchArticleDetail(article: stubArticle!)
        let displayArticle = stubArticleDetailViewController.tableViewDataSource.article
        XCTAssertNotNil(displayArticle.imageLink)
    }
   
    
   

    
    


}
