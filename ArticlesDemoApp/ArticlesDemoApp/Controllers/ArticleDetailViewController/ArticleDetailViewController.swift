//
//  ArticleDetailViewController.swift
//  ArticlesDemoApp
//
//  Created by Waqas Sultan on 9/10/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import UIKit



protocol ArticleDetailViewControllerDisplayedLogic {
    func displayFetchArticleDetail(viewModel: DetailViewModel.DisplayViewModel.ArticleDetailViewModel)
}

class ArticleDetailViewController: UIViewController,ArticleDetailViewControllerDisplayedLogic {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    let configurator = ArticleDetailConfigurator()
    
    var tableViewDataSource:ArticleDetailTableViewDataSource!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configurator.configure(viewController: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    
        registerCellForTableView()
        configureTableViewDataSource()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    
    internal func registerCellForTableView() {
        self.tableView.register(UINib(nibName: "ArticleTitleTableViewCell", bundle: nil), forCellReuseIdentifier: "ArticleTitleTableViewCell")
        self.tableView.register(UINib(nibName: "ArticleInfoTableViewCell", bundle: nil), forCellReuseIdentifier: "ArticleInfoTableViewCell")
        self.tableView.register(UINib(nibName: "ArticleImageTableViewCell", bundle: nil), forCellReuseIdentifier: "ArticleImageTableViewCell")

    }
    
    internal func configureTableViewDataSource(tblViewDataSource:ArticleDetailTableViewDataSource = ArticleDetailTableViewDataSource()) {
        
        if tableViewDataSource == nil {
            tableViewDataSource = tblViewDataSource
        }
        if let tableView = tableView {
            tableView.delegate = tableViewDataSource
            tableView.dataSource = tableViewDataSource
        }
        
    }
    
    func displayFetchArticleDetail(viewModel: DetailViewModel.DisplayViewModel.ArticleDetailViewModel) {
        self.tableViewDataSource.article = viewModel
       // self.tableView.reloadData()
    }
    
    
    
    
}
