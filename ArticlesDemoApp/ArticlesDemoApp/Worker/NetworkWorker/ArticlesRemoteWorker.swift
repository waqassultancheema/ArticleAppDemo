//
//  ArticlesRemoteApi.swift
//  ArticlesDemoApp
//
//  Created by Waqas Sultan on 9/8/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//



import Foundation
class ArticlesRemoteWorker: NSObject {
   
    
    var serviceApi:ServiceApi!
    func fetchArticless(request:Request.Fetch.ArticleRequest , complete :@escaping (Articles) -> Void, failure:@escaping (String?) -> Void) {
        
        if serviceApi == nil {
            serviceApi = ServiceApi()
        }
        serviceApi.getData(url: request.mURL, withMethod: .GET) {  (response, error) in
            guard error == nil else {
                failure(error?.localizedDescription)
                return
            }
            
            if let mData = response as? Data {
                do {
                    let article = try Articles(data: mData)
                   complete(article)
                } catch  {
                    failure(error.localizedDescription)
                }
            }
        }
    }
    
    
    
    
    
    
    
}
