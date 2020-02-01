//
//  ArticleImageTableViewCell.swift
//  ArticlesDemoApp
//
//  Created by Waqas Sultan on 9/10/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import UIKit

class ArticleImageTableViewCell: UITableViewCell {

    @IBOutlet weak var newsImageView: ImageDownloader!
    @IBOutlet weak var captionLabel: UILabel!
    
    @IBOutlet weak var activityIndictor: UIActivityIndicatorView!
    
   
    
    func setImageURL(url:String) {
        newsImageView.loadImageUsingUrlString(urlString: url, activityIndictor: activityIndictor)
    }

}
