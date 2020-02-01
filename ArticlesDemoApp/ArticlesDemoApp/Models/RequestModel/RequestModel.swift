//
//  RequestModel.swift
//  ArticlesDemoApp
//
//  Created by Waqas Sultan on 9/11/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import Foundation


enum TimePeriod : String, CaseIterable {
    case Day = "1"
    case Week = "7"
    case Month = "30"
    
    static let names = [Day, Week, Month]
    
    var name: String {
        switch self {
        case .Day:
            return "Day"
        case .Week:
            return "Week"
        case .Month:
            return "Month"
        }
    }
}

enum Request {
    enum Fetch
    {
        struct ArticleRequest
        {
            var timePeriod:TimePeriod = TimePeriod.Week

            private var apiKey:String {
                return "3w3N0dqmHWHrgbM9hc1rHUeduTeme2H8"
            }
            var mURL: String {
                let url = String(format: APIURLPrefix + "/mostpopular/v2/mostviewed/all-sections/\(timePeriod.rawValue)?api-key=\(apiKey)")
                return url
            }
        }
    }
}
