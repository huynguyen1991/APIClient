//
//  APIClient.swift
//  ProApp
//
//  Created by Huy Nguyễn on 3/18/20.
//  Copyright © 2020 Huy Nguyễn. All rights reserved.
//

import Foundation
import Alamofire

typealias ResultCallback<Response> = (Result<Response, APIError>) -> Void

public class APIClient {
    public static let share = APIClient()
    public var config: APIConfig?
    
    func send<T: APIRequestable>(_  request: T, completion: @escaping ResultCallback<APIResponse<T.Response>>) {
        guard let endpointURL = URL(string: request.entryPoint.value.apiName, relativeTo: self.config?.baseEndpointUrl) else { return }
        print("request.entryPoint.value.apiName \(request.entryPoint.value.apiName)")
        print("endpointURL \(endpointURL)")
        print(" request.entryPoint.httpMethod \( request.entryPoint.httpMethod)")
        AF.request(endpointURL, method: request.entryPoint.httpMethod, parameters: request,
                   headers: request.headers.value).responseDecodable(of: APIResponse<T.Response>.self) { response in
                    print("endpointURL \(endpointURL)")
                    switch response.result {
                    case .success(let model):
                        if model.code == self.config?.codeSuccess {
                            completion(.success(model))
                        } else {
                            completion(.failure(APIError.server(status: model.code, message: model.message)))
                        }
                    case .failure(let error):
                        print("endpointURL \(endpointURL)")
                        completion(.failure(APIError.http(error: error)))
                    }
                }
        }
}
    
