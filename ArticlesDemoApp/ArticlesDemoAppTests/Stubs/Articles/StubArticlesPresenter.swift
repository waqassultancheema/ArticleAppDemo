//
//  StubArticlesPresenter.swift
//  ArticlesDemoAppTests
//
//  Created by Waqas Sultan on 9/8/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import Foundation
@testable import ArticlesDemoApp

class StubArticlesPresenter: ArticlesPresenter {

    var presentFetchedArticlesCalled = false
    
    
    override func presentFetchArticles(articles: Articles) {
        super.presentFetchArticles(articles: articles)
        presentFetchedArticlesCalled  = true
    }
   
    

}
