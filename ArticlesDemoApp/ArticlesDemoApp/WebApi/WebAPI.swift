//
//  WebAPI.swift
//  ArticlesDemoApp
//
//  Created by Waqas Sultan on 9/8/19.
//  Copyright © 2019 Waqas Sultan. All rights reserved.
//

import Foundation

typealias onCompletion = (Any?, NetworkError?)->()

public enum URLMethod: String {
    case GET
    case POST
    case DELETE
    case PUT
    case PATCH
}


protocol WebAPIHandler {
    func getDataFromServer( url: String, withMethod method: URLMethod?,completion: @escaping onCompletion) -> URLSessionTask?
}
