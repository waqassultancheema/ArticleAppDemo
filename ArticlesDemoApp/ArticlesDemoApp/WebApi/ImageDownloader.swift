//
//  ImageDownloader.swift
//  ArticlesDemoApp
//
//  Created by Waqas Sultan on 9/8/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()

class ImageDownloader: UIImageView {
    
    var imageUrlString: String?
    
   public func loadImageUsingUrlString(urlString: String,activityIndictor:UIActivityIndicatorView) {
        
        imageUrlString = urlString
        
        image = nil
       activityIndictor.isHidden = false
    activityIndictor.startAnimating()

        ServiceApi.shared.getData(url: urlString, withMethod: nil) { [weak self] (data, error) in
            if error != nil {
                print(error ?? "")
                 DispatchQueue.main.async {
                    self?.image  = #imageLiteral(resourceName: "asset1")
                activityIndictor.stopAnimating()
                    activityIndictor.isHidden = true

                }

                return
            }
            
            DispatchQueue.main.async {
                
                if let d = data {
                    let imageToCache = UIImage(data: d as! Data)
                    
                    if self?.imageUrlString == urlString {
                        self?.image = imageToCache
                    }
                    if let imageToCac = imageToCache {
                        imageCache.setObject(imageToCac, forKey: urlString as NSString)
                    }
                } else {
                    self?.image  = #imageLiteral(resourceName: "asset1")
                }
                activityIndictor.stopAnimating()
                activityIndictor.isHidden = true
            }
        }
    }
    
}

