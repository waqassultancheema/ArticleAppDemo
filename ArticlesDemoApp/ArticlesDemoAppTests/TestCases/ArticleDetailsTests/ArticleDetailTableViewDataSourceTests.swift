//
//  ArticleDetailTableViewDataSourceTests.swift
//  ArticlesDemoAppTests
//
//  Created by Waqas Sultan on 9/14/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import XCTest

@testable import ArticlesDemoApp

class ArticleDetailTableViewDataSourceTests: XCTestCase {

    var sut:ArticleDetailTableViewDataSource?
    var articleDetailViewController:ArticleDetailViewController?
    var stubTableView:StubTableView?
    override func setUp() {
        super.setUp()
        
        
        articleDetailViewController =  (UIStoryboard.viewController(screenName: "ArticleDetailViewController", storyboardName: "Main") as! ArticleDetailViewController)
        stubTableView = StubTableView(frame: CGRect(x: (articleDetailViewController?.view.frame.origin.x)!, y: (articleDetailViewController?.view.frame.origin.y)!, width: (articleDetailViewController?.view.frame.size.width)!, height: (articleDetailViewController?.view.frame.size.height)!), style: .plain)
        articleDetailViewController?.tableView = stubTableView
        articleDetailViewController?.viewDidLoad()
        sut = articleDetailViewController?.tableViewDataSource
        articleDetailViewController?.configurator.interactor.getArticleDetail(article: StubArticle.dummyArticle())
    }
    
    func testCellForTitleIndexPath() {
        
        let cell:ArticleTitleTableViewCell = sut?.tableView(stubTableView!, cellForRowAt:IndexPath(row: 0, section: 0)) as! ArticleTitleTableViewCell
        
        XCTAssertTrue(cell.titleLabel.text?.count ?? 0 > 0)
    }
    
    func testCellForInfoIndexPath() {
        
        let cell:ArticleInfoTableViewCell = sut?.tableView(stubTableView!, cellForRowAt:IndexPath(row: 1, section: 0)) as! ArticleInfoTableViewCell
        
        XCTAssertTrue(cell.bylineLabel.text?.count ?? 0 > 0)
    }
    
    func testCellForImageIndexPath() {
        
        let cell:ArticleImageTableViewCell = sut?.tableView(stubTableView!, cellForRowAt:IndexPath(row: 2, section: 0)) as! ArticleImageTableViewCell
        
        XCTAssertTrue(cell.captionLabel.text?.count ?? 0 > 0)
    }
    
    
    func testCellForNumberOfItems() {
        
        let row  = sut?.tableView(stubTableView!, numberOfRowsInSection: 0)
        
        XCTAssertTrue(row ?? 0 > 0)
    }
    
    

    

}
