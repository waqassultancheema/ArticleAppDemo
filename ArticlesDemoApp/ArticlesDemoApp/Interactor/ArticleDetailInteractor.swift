//
//  ArticleDetailInteractor.swift
//  ArticlesDemoApp
//
//  Created by Waqas Sultan on 9/10/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import UIKit

protocol ArticleDetailInteractorInput {
    func getArticleDetail(article:Article)
}
protocol ArticleDetailInteractorOutput {
    func passedToPresenterFetchedArticles(article:Article)
}
class ArticleDetailInteractor:ArticleDetailInteractorInput {
    
    
    var output: ArticleDetailInteractorOutput!

    func getArticleDetail(article: Article) {
        
        self.output.passedToPresenterFetchedArticles(article: article)
    }
    
    
}
