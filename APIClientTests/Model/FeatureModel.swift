//
//  FeatureModel.swift
//  ProApp
//
//  Created by Huy Nguyễn on 3/19/20.
//  Copyright © 2020 Huy Nguyễn. All rights reserved.
//

import Foundation

class FeatureModel {
    var fetchDataComplete: (()->())?
    var usersData: Comic?
    
    func fetchData() -> Void {
        APIClient.share.send(GetComic(comicId: 0)) { response in
            switch response {
            case .success(let model): break
               
            case .failure(let error):
                switch error {
                case .server(let status,let message): break
                case .http(let error): break
                }
               
            }
        }
    }
}




