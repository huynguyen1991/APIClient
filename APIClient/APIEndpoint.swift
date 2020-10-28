//
//  APIEntryPoint.swift
//  ProApp
//
//  Created by Huy Nguyễn on 3/18/20.
//  Copyright © 2020 Huy Nguyễn. All rights reserved.
//

import Foundation
import Alamofire

enum APIEndpoint {
    case config(apiName: String, method: HTTPMethod = .post)
    
    var value: (apiName: String, httpMethod: HTTPMethod) {
        switch self {
        case .config(let apiName,let method):
            return (apiName, method)
        }
    }
    
    var apiName: String {
       return value.apiName
    }
    
    var httpMethod: HTTPMethod {
        return value.httpMethod
    }
}
