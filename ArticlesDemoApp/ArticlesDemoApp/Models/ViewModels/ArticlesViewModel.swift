//
//  ArticlesViewModel.swift
//  ArticlesDemoApp
//
//  Created by Waqas Sultan on 9/8/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import Foundation


struct ViewModel {
    
    
    struct DisplayViewModel {
        struct ArticlesViewModel {
            var title:String = ""
            var byLine:String = ""
            var publishedDate:String = ""
            var imageLink:String = ""
            
        }
        var articles:[DisplayViewModel.ArticlesViewModel]
    }
}

struct DetailViewModel {
    
    
    struct DisplayViewModel {
        struct ArticleDetailViewModel {
            var title:String = ""
            var byLine:String = ""
            var publishedDate:String = ""
            var imageLink:String = ""
            var source:String = ""
            var caption:String = ""
            
        }
        var article:ArticleDetailViewModel
    }
    
    
}
