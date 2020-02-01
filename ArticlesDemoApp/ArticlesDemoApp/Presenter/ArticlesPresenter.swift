//
//  ArticlesPresenter.swift
//  ArticlesDemoApp
//
//  Created by Waqas Sultan on 9/8/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//


import UIKit
protocol ArticlesPresenterInput
{
    func presentFetchArticles(articles:Articles)
    func presentFetchedError(error:String)
}

protocol ArticlesPresenterOutput: class
{
    func successFetchedArticles(viewModel: ViewModel.DisplayViewModel)
    func errorWhileFetchingArticles(error:String)
}
class ArticlesPresenter:ArticlesPresenterInput {
 
    var output:ArticlesPresenterOutput!
    
    func presentFetchArticles(articles:Articles) {
        if let output  = output {
            let usersDisplayModel =  convertDataIntoViewModel(articles: articles)
            
            let viewModel = ViewModel.DisplayViewModel.init(articles: usersDisplayModel)
            
            output.successFetchedArticles(viewModel:viewModel)
        }
       

    }
    
    func presentFetchedError(error: String) {
         output.errorWhileFetchingArticles(error: error)
    }
    
    
    func convertDataIntoViewModel(articles:Articles) ->  [ViewModel.DisplayViewModel.ArticlesViewModel] {

        var displayViewModels:[ViewModel.DisplayViewModel.ArticlesViewModel] = []

        for article in articles.results {

                var articlesViewModel:ViewModel.DisplayViewModel.ArticlesViewModel = ViewModel.DisplayViewModel.ArticlesViewModel()
                articlesViewModel.title = article.title
                articlesViewModel.byLine = article.byline
                articlesViewModel.publishedDate = article.publishedDate
                  if  let media = article.media.first, let metadata = media.mediaMetadata.first?.url {
                    articlesViewModel.imageLink = metadata
            }
                displayViewModels.append(articlesViewModel)
            }
        return displayViewModels
    }
}


