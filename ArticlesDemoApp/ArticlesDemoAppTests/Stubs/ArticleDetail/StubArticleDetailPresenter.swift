//
//  StubArticleDetailPresenter.swift
//  ArticlesDemoAppTests
//
//  Created by Waqas Sultan on 9/12/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import Foundation
@testable import ArticlesDemoApp

class StubArticleDetailPresenter: ArticleDetailPresenter {

    var presentFetchedArticlesCalled = false
    
    
    override func presentFetchArticleDetail(article: Article) {
        super.presentFetchArticleDetail(article: article)
        presentFetchedArticlesCalled = true
    }
    
}
