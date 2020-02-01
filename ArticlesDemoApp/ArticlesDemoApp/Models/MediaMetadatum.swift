//
//  MediaMetatum.swift
//  ArticlesDemoApp
//
//  Created by Waqas Sultan on 9/8/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import Foundation

// MARK: - MediaMetadatum
class MediaMetadatum: Codable {
    let url: String
    let format: Format
    let height, width: Int
    
    init(url: String, format: Format, height: Int, width: Int) {
        self.url = url
        self.format = format
        self.height = height
        self.width = width
    }
}


enum Format: String, Codable {
    case jumbo = "Jumbo"
    case large = "Large"
    case largeThumbnail = "Large Thumbnail"
    case mediumThreeByTwo210 = "mediumThreeByTwo210"
    case mediumThreeByTwo440 = "mediumThreeByTwo440"
    case normal = "Normal"
    case square320 = "square320"
    case square640 = "square640"
    case standardThumbnail = "Standard Thumbnail"
    case superJumbo = "superJumbo"
}
