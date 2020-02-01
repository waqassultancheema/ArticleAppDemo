//
// ArticlesViewController.swift
//  ArticlesDemoApp
//
//  Created by Waqas Sultan on 9/8/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import UIKit

protocol ArticlesViewControllerGetArticles
{
    func fetchItems(timePeriod:TimePeriod,searchString:String)
}

protocol ArticlesViewControllerDisplayedLogic {
    func displayFetchArticles(viewModel:ViewModel.DisplayViewModel)
}

class ArticlesViewController: UIViewController,ArticlesViewControllerDisplayedLogic {

    
    @IBOutlet weak var tableView: UITableView!
    
    

    let configurator = ArticlesConfigurator()

    var requestArticles: ArticlesViewControllerGetArticles!
    var router: ArticlesAppRouter!
    var tableViewDataSource:ArticlesTableViewDataSource!
   
    let searchBar:UISearchBar = UISearchBar()
     var selectedTimePeriod = TimePeriod.Week
     var searchString = ""
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configurator.configure(viewController: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCellForTableView()
        configureTableViewDataSource()
       
        fetchArticles()
        handleTableViewSelection()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        router.prepare(for: segue, sender: sender)
    }
    
    internal func registerCellForTableView() {
    
        self.tableView.register(UINib(nibName: "ArticlesTableViewCell", bundle: nil), forCellReuseIdentifier: "ArticlesTableViewCell")

    }
    
    internal func fetchArticles() {
        self.view.startActivityIndicator()
        self.requestArticles.fetchItems(timePeriod: self.selectedTimePeriod, searchString:searchString )
    }
    internal func configureTableViewDataSource(tabeViewDataSource:ArticlesTableViewDataSource = ArticlesTableViewDataSource()) {
        tableViewDataSource  = tabeViewDataSource
        tableViewDataSource.delegate = self
        if let tableView = tableView {
            tableView.delegate = tableViewDataSource
            tableView.dataSource = tableViewDataSource
        }
    }
    
    internal func configureSearchView() {
        searchBar.sizeToFit()
        searchBar.placeholder = "Search Articles"
        searchBar.delegate = self
        tableView.tableHeaderView = searchBar
        
    }
  
    
    func displayFetchArticles(viewModel: ViewModel.DisplayViewModel) {
        self.tableViewDataSource.articles = viewModel.articles
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.view.stopActivityIndicator()
            
        }
    }
    
    func errorArticles(error: String) {
        DispatchQueue.main.async {
            self.tableView.reloadData()
            self.view.stopActivityIndicator()
            self.displayalert(title: "Error", message: error)
        }
    }
    
    
    
    
    @IBAction func btnSearchAction(_ sender: Any) {
        let button : UIButton = sender as! UIButton
        
        button.isSelected = !button.isSelected
        
        if button.isSelected {
            configureSearchView()
        } else {
            tableView.tableHeaderView = nil
        }
    }
    
    @IBAction func btnMoreOptionAction(_ sender: Any) {
        self.showTimePeriodFilters()
    }
    
    
    
}
extension ArticlesViewController : ArticlesTableViewDataSourceDelegate {
    func selectedArticle(index: Int) {
        self.router.showDetailViewController(index: index)
    }
    
    
}

extension ArticlesViewController : UISearchBarDelegate {
   
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchString = ""
        self.fetchArticles()
        searchBar.resignFirstResponder()
        searchBar.endEditing(true)
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchString = searchText
        self.fetchArticles()

    }
}

extension ArticlesViewController: ArticlesPresenterOutput , AlertView
{
    func successFetchedArticles(viewModel: ViewModel.DisplayViewModel) {
        self.displayFetchArticles(viewModel: viewModel)
    }
    
    func errorWhileFetchingArticles(error: String) {
        self.errorArticles(error: error)
    }
    
    
    
    func handleTableViewSelection() {
        //        self.tableViewDataSource.userSelected  = { [unowned self] (user) in
        //
        //
        //        }
        
    }
}
