//
//  ArticleDetailConfigurator.swift
//  ArticlesDemoApp
//
//  Created by Waqas Sultan on 9/10/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import UIKit

extension ArticleDetailViewController: ArticleDetailPresenterOutput
{
    func successFetchedArticleDetail(viewModel: DetailViewModel.DisplayViewModel.ArticleDetailViewModel) {
        self.displayFetchArticleDetail(viewModel: viewModel)
    }
    
    
    
    
    
    
}


extension ArticleDetailPresenter: ArticleDetailInteractorOutput
{
    func passedToPresenterFetchedArticles(article: Article) {
        self.presentFetchArticleDetail(article: article)
    }

    
    
    
}

class ArticleDetailConfigurator: NSObject {
    
    let presenter = ArticleDetailPresenter()
    let interactor = ArticleDetailInteractor()
    
    
    // MARK: - Configuration
    
    func configure(viewController: ArticleDetailViewController)
    {
        presenter.output = viewController
        interactor.output = presenter
    }
}
