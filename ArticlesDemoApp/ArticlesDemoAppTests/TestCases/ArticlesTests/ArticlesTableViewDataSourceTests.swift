//
//  ArticleTableViewDataSourceTests.swift
//  ArticlesDemoAppTests
//
//  Created by Waqas Sultan on 9/13/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import XCTest

@testable import ArticlesDemoApp

class ArticlesTableViewDataSourceTests: XCTestCase {

    var sut:ArticlesTableViewDataSource?
    var articleViewController:ArticlesViewController?
    var stubTableView:StubTableView?
    var stubWorker:StubArticlesRemoteWorker?
    override func setUp() {
        super.setUp()
        
        stubWorker = StubArticlesRemoteWorker()
        stubWorker?.dataToReturnOnSuccess = StubArticles.dummyArticle()
        
        articleViewController =  (UIStoryboard.viewController(screenName: "ArticlesViewController", storyboardName: "Main") as! ArticlesViewController)
        stubTableView = StubTableView(frame: CGRect(x: (articleViewController?.view.frame.origin.x)!, y: (articleViewController?.view.frame.origin.y)!, width: (articleViewController?.view.frame.size.width)!, height: (articleViewController?.view.frame.size.height)!), style: .plain)
        articleViewController?.tableView = stubTableView
        articleViewController?.viewDidLoad()
        sut = articleViewController?.tableViewDataSource
        
        articleViewController?.configurator.interactor.worker = stubWorker
        articleViewController?.fetchArticles()
    }
    
    func testCellForIndexPath() {
        
        _ = sut?.tableView(stubTableView!, cellForRowAt:IndexPath(row: 0, section: 0))

        XCTAssertTrue(stubTableView!.isdequeueCalled)
    }
    
    func testCellForNumberOfItems() {
        
        let row  = sut?.tableView(stubTableView!, numberOfRowsInSection: 0)
        
        XCTAssertTrue(row ?? 0 > 0)
    }
    

    

}

