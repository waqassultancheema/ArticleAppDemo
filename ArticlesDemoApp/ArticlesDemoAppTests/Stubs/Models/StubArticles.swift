//
//  StubArticles.swift
//  ArticlesDemoAppTests
//
//  Created by Waqas Sultan on 9/8/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import Foundation

@testable import ArticlesDemoApp

class StubArticles:Articles {

   static func dummyArticle() -> StubArticles  {
      return  StubArticles(status: "testStatus", copyright: "Test", numResults: 0, results: [StubArticle.dummyArticle()])
    }
}
