//
//  APIRequestRepresentable.swift
//  ProApp
//
//  Created by Huy Nguyễn on 3/18/20.
//  Copyright © 2020 Huy Nguyễn. All rights reserved.
//

import Foundation
import Alamofire

protocol APIRequestable: Encodable {
    associatedtype Response: Decodable
  
    var entryPoint: APIEndpoint { get }
    var headers: APIHeaders { get }
    var token: String { get }
}

extension APIRequestable {
    var headers: APIHeaders { get { return .none } }
    var token: String {get {return "none"} }
}
