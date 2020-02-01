//
//  StubMediaMetadatum.swift
//  ArticlesDemoAppTests
//
//  Created by Waqas Sultan on 9/12/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import Foundation
@testable import ArticlesDemoApp

class StubMediaMetadatum: MediaMetadatum {

    static func dummyMediatim() -> StubMediaMetadatum  {
        return  StubMediaMetadatum(url: "https://static01.nyt.com/images/2019/07/16/opinion/16friedman1/merlin_157872765_8453a3d3-e2ef-4d15-9001-d0e11d8fdecc-superJumbo.jpg", format: Format.superJumbo, height: 0, width: 0)
    }
    static func dummyMediatimWithNormalFormat() -> StubMediaMetadatum  {
        return  StubMediaMetadatum(url: "https://static01.nyt.com/images/2019/07/16/opinion/16friedman1/merlin_157872765_8453a3d3-e2ef-4d15-9001-d0e11d8fdecc-superJumbo.jpg", format: Format.normal, height: 0, width: 0)
    }
}
