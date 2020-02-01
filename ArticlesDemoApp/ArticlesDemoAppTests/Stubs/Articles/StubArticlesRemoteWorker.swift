//
//  StubArticlesRemoteWorker.swift
//  ArticlesDemoAppTests
//
//  Created by Waqas Sultan on 9/8/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import Foundation

@testable import ArticlesDemoApp

class StubArticlesRemoteWorker: ArticlesRemoteWorker {

    var shouldFailOnFetch:Bool = false
    var dataToReturnOnSuccess:Articles?
    

    override func fetchArticless(request: Request.Fetch.ArticleRequest, complete: @escaping (Articles) -> Void, failure: @escaping (String?) -> Void) {
        if shouldFailOnFetch {
            failure(NetworkError.other("Test failing").localizedDescription)
        } else {
            if let data = dataToReturnOnSuccess {
                complete(data)
            }
        }
    }
    
    
    
}
