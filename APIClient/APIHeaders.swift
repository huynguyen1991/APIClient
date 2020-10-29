//
//  APIHeaders.swift
//  ProApp
//
//  Created by Huy Nguyễn on 4/5/20.
//  Copyright © 2020 Huy Nguyễn. All rights reserved.
//

import Foundation
import Alamofire

enum APIHeaders {
    case none
    case required(headers: HTTPHeaders)
    
    var value: HTTPHeaders {
        switch self {
        case .required(let headers):
            return headers
        default:
            return ["Content-Type":"application/json"]
        }
    }
}
