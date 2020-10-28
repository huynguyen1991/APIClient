//
//  APIConfig.swift
//  ProApp
//
//  Created by NTQ on 9/16/20.
//  Copyright © 2020 Huy Nguyễn. All rights reserved.
//

import Foundation

public protocol APIConfig {
    var baseEndpointUrl: URL { get }
    var codeSuccess: Int { get }
    var invalidToken: Int { get }
}
