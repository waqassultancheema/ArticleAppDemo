//
//  StubMedia.swift
//  ArticlesDemoAppTests
//
//  Created by Waqas Sultan on 9/12/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import Foundation
@testable import ArticlesDemoApp

class StubMedia: Media {

    static func dummyMedia() -> StubMedia  {
        return  StubMedia(type: MediaType.image, subtype: Subtype.photo, caption: "", copyright: "", approvedForSyndication: 0, mediaMetadata: [StubMediaMetadatum.dummyMediatim(),StubMediaMetadatum.dummyMediatimWithNormalFormat()])
    }
}
