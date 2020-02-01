//
//  ArticleImageTests.swift
//  ArticlesDemoAppTests
//
//  Created by Waqas Sultan on 9/13/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import XCTest
@testable import ArticlesDemoApp

class ArticleImageTests: XCTestCase {

    var sut:ArticleImageTableViewCell?
    var stubImageView:StubImageDownloader?
    var activityInd = UIActivityIndicatorView(style: .white)
    override func setUp() {
        super.setUp()
        
        sut = ArticleImageTableViewCell(style: .default, reuseIdentifier: "ArticleImageTableViewCell")
       stubImageView  = StubImageDownloader(image: UIImage(named: ""))
        sut?.activityIndictor = activityInd
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testImageURLIsCalled() {
        sut?.newsImageView = stubImageView
        sut?.setImageURL(url: "")
        
        XCTAssertEqual(stubImageView?.isLoadImageURLCalled, true)
    }

   

}
