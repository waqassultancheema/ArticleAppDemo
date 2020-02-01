//
//  ArticlesConfigurator.swift
//  ArticlesDemoApp
//
//  Created by Waqas Sultan on 9/8/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import UIKit










extension ArticlesInteractor: ArticlesViewControllerGetArticles
{
    func fetchItems(timePeriod: TimePeriod, searchString: String) {
        self.fetchArticles(timePeriod: timePeriod, searchString: searchString)

    }
    
   
    
   


}

extension ArticlesPresenter: ArticlesInteractorOutput
{
    func passedToPresenterFetchedArticles(articles:Articles) {
        self.presentFetchArticles(articles: articles)

    }
    
    
    func errorWhileFetchArticles(error: String) {
        self.presentFetchedError(error: error)
    }
    
   
}

class ArticlesConfigurator: NSObject {

    let presenter = ArticlesPresenter()
    let interactor = ArticlesInteractor()
    let router = ArticlesAppRouter()


    // MARK: - Configuration

    func configure(viewController: ArticlesViewController)
    {
        router.articlesViewController = viewController
        presenter.output = viewController
        

        interactor.output = presenter
        router.datasource = interactor
        viewController.requestArticles = interactor
        viewController.router = router
    }
}
