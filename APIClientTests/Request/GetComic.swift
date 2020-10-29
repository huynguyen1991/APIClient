//
//  GetComic.swift
//  ProApp
//
//  Created by Huy Nguyễn on 3/19/20.
//  Copyright © 2020 Huy Nguyễn. All rights reserved.
//

import Foundation
@testable import APIClient
struct GetComic: APIRequestable {
    typealias Response = Comic
    
    var entryPoint: APIEndpoint {return .config(apiName: APIName.detailPicture.rawValue)}

    let comicId: Int
}
