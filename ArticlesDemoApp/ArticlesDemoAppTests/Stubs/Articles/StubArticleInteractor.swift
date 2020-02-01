//
//  StubArticleInteractor.swift
//  ArticlesDemoAppTests
//
//  Created by Waqas Sultan on 9/12/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import Foundation
@testable import ArticlesDemoApp


class StubArticleInteractor: ArticlesInteractor {
    
    
    override func fetchArticles(timePeriod: TimePeriod, searchString: String) {
        self.filterdArticles = StubArticles.dummyArticle()
        self.output.passedToPresenterFetchedArticles(articles: self.filterdArticles)
    }

}
