//
//  Result.swift
//  ArticlesDemoApp
//
//  Created by Waqas Sultan on 9/8/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import Foundation

enum Source: String, Codable {
    case theNewYorkTimes = "The New York Times"
}

enum ResultType: String, Codable {
    case article = "Article"
}

// MARK: - Result
class Article: Codable {
    let url: String
    let adxKeywords: String
    let column: String?
    let section, byline: String
    let type: String
    let title, abstract, publishedDate: String
    let source: Source
    let id, assetID, views: Int
    
    let media: [Media]
    
    enum CodingKeys: String, CodingKey {
        case url
        case adxKeywords = "adx_keywords"
        case column, section, byline, type, title, abstract
        case publishedDate = "published_date"
        case source, id
        case assetID = "asset_id"
        case views
        case media
    }
    
    init(url: String, adxKeywords: String, column: String?, section: String, byline: String, type: String, title: String, abstract: String, publishedDate: String, source: Source, id: Int, assetID: Int, views: Int,  media: [Media]) {
        self.url = url
        self.adxKeywords = adxKeywords
        self.column = column
        self.section = section
        self.byline = byline
        self.type = type
        self.title = title
        self.abstract = abstract
        self.publishedDate = publishedDate
        self.source = source
        self.id = id
        self.assetID = assetID
        self.views = views
        
        self.media = media
    }
}

// MARK: Result convenience initializers and mutators

extension Article {
    convenience init(data: Data) throws {
        let me = try newJSONDecoder().decode(Article.self, from: data)
        self.init(url: me.url, adxKeywords: me.adxKeywords, column: me.column, section: me.section, byline: me.byline, type: me.type, title: me.title, abstract: me.abstract, publishedDate: me.publishedDate, source: me.source, id: me.id, assetID: me.assetID, views: me.views,  media: me.media)
    }
    
    convenience init(_ jsonDic: Dictionary<String,AnyObject>) throws {
        let jsonData = try JSONSerialization.data(withJSONObject: jsonDic, options: .prettyPrinted)
        try self.init(data: jsonData)
        
    }
    
    
    
    
}



