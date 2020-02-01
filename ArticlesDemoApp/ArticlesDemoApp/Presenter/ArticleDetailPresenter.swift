//
//  ArticleDetailPresenter.swift
//  ArticlesDemoApp
//
//  Created by Waqas Sultan on 9/10/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import UIKit

protocol ArticleDetailPresenterInput
{
    func presentFetchArticleDetail(article:Article)
}

protocol ArticleDetailPresenterOutput: class
{
    func successFetchedArticleDetail(viewModel: DetailViewModel.DisplayViewModel.ArticleDetailViewModel)
}
class ArticleDetailPresenter:ArticleDetailPresenterInput {
    
    var output:ArticleDetailPresenterOutput!
    
    func presentFetchArticleDetail(article:Article) {
        
        if let output  = output {
            var imageLink  = ""
            if  let media = article.media.first {
                let metadataArray = media.mediaMetadata.filter { (mediaMetaData) -> Bool in
                    if mediaMetaData.format == .superJumbo {
                        return true
                    }
                    return false
                }
                if let metaData = metadataArray.first {
                    imageLink = metaData.url
                }
            }
            let viewModel = DetailViewModel.DisplayViewModel.ArticleDetailViewModel(title: article.title, byLine: article.byline, publishedDate: article.publishedDate, imageLink:imageLink, source: article.source.rawValue,caption: article.adxKeywords)
            output.successFetchedArticleDetail(viewModel:viewModel)
        }
        
        
    }
    
   
    
    
    
}

