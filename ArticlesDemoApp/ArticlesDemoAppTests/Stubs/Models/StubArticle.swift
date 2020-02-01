//
//  StubResult.swift
//  ArticlesDemoAppTests
//
//  Created by Waqas Sultan on 9/9/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import Foundation

@testable import ArticlesDemoApp
class StubArticle: Article {

    static func dummyArticle() -> StubArticle  {
        return  StubArticle(url: "", adxKeywords: "testKeyword", column: "", section: "", byline: "testBytline", type: "", title: "test", abstract: "", publishedDate: "testData", source: Source.theNewYorkTimes, id: 0, assetID: 0, views: 0,  media: [StubMedia.dummyMedia()])
    }
}
