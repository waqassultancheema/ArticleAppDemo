//
//  StubArticlesViewController.swift
//  ArticlesDemoAppTests
//
//  Created by Waqas Sultan on 9/8/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import UIKit
@testable import ArticlesDemoApp
class StubArticlesViewController: ArticlesViewController {

    
    
    var error:String = ""
    
    override func viewDidLoad() {
        
    }
    override func configureTableViewDataSource(tabeViewDataSource: ArticlesTableViewDataSource = ArticlesTableViewDataSource()) {
        tableViewDataSource  = ArticlesTableViewDataSource()

    }
    
    
    override func displayFetchArticles(viewModel: ViewModel.DisplayViewModel) {
        tableViewDataSource.articles = viewModel.articles
    }
    
    override func errorArticles(error: String) {
        self.error = error
        self.view.stopActivityIndicator()
    }

}
