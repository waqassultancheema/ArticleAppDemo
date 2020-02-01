//
//  StubArticleDetailViewController.swift
//  ArticlesDemoAppTests
//
//  Created by Waqas Sultan on 9/12/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import UIKit

@testable import ArticlesDemoApp
class StubArticleDetailViewController: ArticleDetailViewController {
    
    
    
    
    
    override func configureTableViewDataSource(tblViewDataSource: ArticleDetailTableViewDataSource = ArticleDetailTableViewDataSource()) {
        tableViewDataSource = tblViewDataSource
    }
    override func displayFetchArticleDetail(viewModel: DetailViewModel.DisplayViewModel.ArticleDetailViewModel) {
        tableViewDataSource.article = viewModel

    }
    
    
    
    
}
