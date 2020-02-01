//
//  Articles.swift
//  ArticlesDemoApp
//
//  Created by Waqas Sultan on 9/8/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//


import Foundation

// MARK: - Articles
class Articles: Codable {
    let status, copyright: String
    let numResults: Int
    let results: [Article]
    
    enum CodingKeys: String, CodingKey {
        case status, copyright
        case numResults = "num_results"
        case results
    }
    
    init(status: String, copyright: String, numResults: Int, results: [Article]) {
        self.status = status
        self.copyright = copyright
        self.numResults = numResults
        self.results = results
    }
}

// MARK: Articles convenience initializers and mutators

extension Articles {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Articles.self, from: data)
        self.init(status: me.status, copyright: me.copyright, numResults: me.numResults, results: me.results)
    }
    
   
    convenience init(_ jsonDic: Dictionary<String,AnyObject>) throws {
        let jsonData = try JSONSerialization.data(withJSONObject: jsonDic, options: .prettyPrinted)
        try self.init(data: jsonData)
        
    }
   
    
    
    
    
}



















