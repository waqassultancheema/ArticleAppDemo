//
//  StubImageDownloader.swift
//  ArticlesDemoAppTests
//
//  Created by Waqas Sultan on 9/13/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import UIKit

@testable import ArticlesDemoApp

class StubImageDownloader: ImageDownloader {
    
    var isLoadImageURLCalled = false
    
    override func loadImageUsingUrlString(urlString: String, activityIndictor: UIActivityIndicatorView) {
        isLoadImageURLCalled = true
    }

}
