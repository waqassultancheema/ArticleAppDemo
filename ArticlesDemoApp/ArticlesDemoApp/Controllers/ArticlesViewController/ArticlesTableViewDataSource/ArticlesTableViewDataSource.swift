//
//  ArticlesTableViewDataSource.swift
//  ArticlesDemoApp
//
//  Created by Waqas Sultan on 02/17/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import UIKit

protocol ArticlesTableViewDataSourceDelegate {
    func selectedArticle(index:Int)
}
class ArticlesTableViewDataSource: NSObject,UITableViewDelegate,UITableViewDataSource {
    
    var articles:[ViewModel.DisplayViewModel.ArticlesViewModel] = Array<ViewModel.DisplayViewModel.ArticlesViewModel>()
    
    
    var delegate:ArticlesTableViewDataSourceDelegate?
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:ArticlesTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ArticlesTableViewCell", for: indexPath) as! ArticlesTableViewCell
        
        let article:ViewModel.DisplayViewModel.ArticlesViewModel = articles[indexPath.row]

        cell.labelTitle.text = article.title
        cell.labelDescription.text = article.byLine
        cell.labelDate.text = "🗓 \(article.publishedDate)"
        


        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.selectedArticle(index: indexPath.row)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return  1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  articles.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    

    
}
