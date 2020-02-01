//
//  ArticlesPresenterTests.swift
//  ArticlesDemoAppTests
//
//  Created by Waqas Sultan on 9/8/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import XCTest

@testable import ArticlesDemoApp

class ArticlesPresenterTests: XCTestCase {

    var stubArticles:StubArticles?
    var sutPres:ArticlesPresenter?

    override func setUp() {
        super.setUp()
        stubArticles = StubArticles.dummyArticle()
        sutPres = ArticlesPresenter()
    }
    
    
    func testPresentArticlesShouldFormatPostForDisplay() {
        
        let sutArticlesViewController:StubArticlesViewController = StubArticlesViewController()
        sutArticlesViewController.configureTableViewDataSource()
        sutPres?.output = sutArticlesViewController
        sutPres?.presentFetchArticles(articles: stubArticles!)
        let displayArticle = sutArticlesViewController.tableViewDataSource.articles.first
        XCTAssertNotNil(displayArticle)
    }

    


}
