//
//  ArticleAppRouterTests.swift
//  ArticlesDemoAppTests
//
//  Created by Waqas Sultan on 9/13/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import XCTest

@testable import ArticlesDemoApp

class ArticleAppRouterTests: XCTestCase {


    var sut:ArticlesAppRouter?
    var articleViewController:ArticlesViewController?
    var stubWorker:StubArticlesRemoteWorker?
    override func setUp() {
        super.setUp()
        sut = ArticlesAppRouter()
        stubWorker = StubArticlesRemoteWorker()
        stubWorker?.dataToReturnOnSuccess = StubArticles.dummyArticle()
        
        articleViewController =  (UIStoryboard.viewController(screenName: "ArticlesViewController", storyboardName: "Main") as! ArticlesViewController)
        articleViewController?.configurator.interactor.worker = stubWorker
        articleViewController?.fetchArticles()
        sut?.articlesViewController = articleViewController
        sut?.datasource = articleViewController?.configurator.interactor

    }
    
    
    func testShowDetailMethod() {
        sut?.showDetailViewController(index: 0)
    }
    
    
   

}
