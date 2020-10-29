//
//  Config.swift
//  ProApp
//
//  Created by NTQ on 10/21/20.
//  Copyright © 2020 Huy Nguyễn. All rights reserved.
//

import Foundation

class Config: APIConfig {
    var baseEndpointUrl: URL {return URL(string: "http://localhost:9090/detailPicture")!}
    
    var codeSuccess: Int {return 0}
}
