//
//  Repository.swift
//  ProApp
//
//  Created by Huy Nguyễn on 3/19/20.
//  Copyright © 2020 Huy Nguyễn. All rights reserved.
//

import Foundation

struct Comic: Decodable {
    public let id: Int
    public let title: String?
    public let issueNumber: Double?
    public let description: String?
    public let pageCount: Int?
}
