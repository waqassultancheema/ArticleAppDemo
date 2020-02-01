//
//  ArticlesAppRouter.swift
//  ArticlesDemoApp
//
//  Created by Waqas Sultan on 9/8/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import UIKit


protocol ArticlesDataPassing {
    var datasource:ArticlesDataSource! {get set}

}
protocol ArticlesAppRouterView {
    func showDetailViewController(index:Int)
    func prepare(for segue: UIStoryboardSegue, sender: Any?)
}

class ArticlesAppRouter: ArticlesAppRouterView,ArticlesDataPassing {
    
    var datasource: ArticlesDataSource!
    var articlesViewController:ArticlesViewController? = nil
    var navigationController:UINavigationController? = nil
    var selectedIndex = 0
    
    func showDetailViewController(index:Int) {
        selectedIndex = index
        articlesViewController?.performSegue(withIdentifier: "showDetail", sender: nil)
    }
    
    func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "showDetail") {
            let viewController = segue.destination as? ArticleDetailViewController
           // viewController?.tableViewDataSource = ArticleDetailTableViewDataSource()
            viewController?.configureTableViewDataSource(tblViewDataSource: ArticleDetailTableViewDataSource())
            viewController?.configurator.interactor.getArticleDetail(article: datasource.filterdArticles.results[selectedIndex])
            
            
        }
    }
    

  
  
    
    
}

