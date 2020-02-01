//
//  Media.swift
//  ArticlesDemoApp
//
//  Created by Waqas Sultan on 9/8/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import UIKit

enum Subtype: String, Codable {
    case photo = "photo"
}

enum MediaType: String, Codable {
    case image = "image"
}
// MARK: - Media
class Media: Codable {
    let type: MediaType
    let subtype: Subtype
    let caption: String?
    let copyright: String?
    let approvedForSyndication: Int
    let mediaMetadata: [MediaMetadatum]
    
    enum CodingKeys: String, CodingKey {
        case type, subtype, caption, copyright
        case approvedForSyndication = "approved_for_syndication"
        case mediaMetadata = "media-metadata"
    }
    
    init(type: MediaType, subtype: Subtype, caption: String?, copyright: String, approvedForSyndication: Int, mediaMetadata: [MediaMetadatum]) {
        self.type = type
        self.subtype = subtype
        self.caption = caption
        self.copyright = copyright
        self.approvedForSyndication = approvedForSyndication
        self.mediaMetadata = mediaMetadata
    }
}

