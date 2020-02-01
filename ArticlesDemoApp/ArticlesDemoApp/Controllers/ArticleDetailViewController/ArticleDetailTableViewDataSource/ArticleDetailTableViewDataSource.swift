//
//  ArticleDetailTableViewDataSource.swift
//  ArticlesDemoApp
//
//  Created by Waqas Sultan on 9/10/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import UIKit


class ArticleDetailTableViewDataSource: NSObject,UITableViewDelegate,UITableViewDataSource {
    
    var article:DetailViewModel.DisplayViewModel.ArticleDetailViewModel = DetailViewModel.DisplayViewModel.ArticleDetailViewModel()
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            let cell:ArticleTitleTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ArticleTitleTableViewCell", for: indexPath) as! ArticleTitleTableViewCell
            cell.titleLabel.text = article.title
            return cell
        } else if indexPath.row == 1 {
            let cell:ArticleInfoTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ArticleInfoTableViewCell", for: indexPath) as! ArticleInfoTableViewCell
            cell.bylineLabel.text  = article.byLine
            cell.dateLabel.text = article.publishedDate
            cell.sourceLabel.text = article.source
            return cell
        }  else  {
            let cell:ArticleImageTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ArticleImageTableViewCell", for: indexPath) as! ArticleImageTableViewCell
            cell.setImageURL(url: article.imageLink)
            cell.captionLabel.text = article.caption
            return cell
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    
}

