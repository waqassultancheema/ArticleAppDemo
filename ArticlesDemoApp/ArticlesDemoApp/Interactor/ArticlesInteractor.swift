//
//  ArticlesInteractor.swift
//  ArticlesDemoApp
//
//  Created by Waqas Sultan on 9/8/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import UIKit

protocol ArticlesDataSource {
    var filterdArticles:Articles! { get}
}
protocol ArticlesInteractorInput {

    func fetchArticles(timePeriod:TimePeriod,searchString:String)
}

protocol ArticlesInteractorOutput {
    func passedToPresenterFetchedArticles(articles:Articles)
    func errorWhileFetchArticles(error:String)
}
class ArticlesInteractor:ArticlesInteractorInput,ArticlesDataSource {
   
    var filterdArticles: Articles!
    var output: ArticlesInteractorOutput!
    var worker: ArticlesRemoteWorker!
    private var articles:Articles!
    private var currenttimePeriod:TimePeriod = TimePeriod.Week
    
    func fetchArticles(timePeriod:TimePeriod,searchString:String) {
        if worker == nil {
            worker = ArticlesRemoteWorker()
        }
        if currenttimePeriod == timePeriod {
            if let articles = articles {
                filterArticles(articles: articles,searchString: searchString)
            } else {
                fetchArticleFromWorker(timePeriod: timePeriod, searchString: searchString)

               
            }

        } else {
            fetchArticleFromWorker(timePeriod: timePeriod, searchString: searchString)
        }
        currenttimePeriod = timePeriod
    
       }
    
    func fetchArticleFromWorker(timePeriod:TimePeriod,searchString:String) {
        worker.fetchArticless ( request: Request.Fetch.ArticleRequest(timePeriod: timePeriod), complete: { [unowned self] (articles) in
            self.articles = articles
            self.filterArticles(articles: articles,searchString: searchString)
        }) { (error) in
            self.output.errorWhileFetchArticles(error: error ?? "Error Occured While Fetching")
            
        }
    }
    
    internal func filterArticles(articles:Articles ,searchString:String) {
        if searchString.count == 0 {
            filterdArticles = Articles(status: articles.status, copyright: articles.copyright, numResults: articles.numResults, results: articles.results)

        } else {
            let results = articles.results.filter({ (article) -> Bool in
                if article.title.contains(searchString) {
                    return true
                }
                return false
            })
            filterdArticles = Articles(status: articles.status, copyright: articles.copyright, numResults: articles.numResults, results: results)
        }
        
        self.output.passedToPresenterFetchedArticles(articles: filterdArticles)

    }
    
    

}
