//
//  Middleware.swift
//  Shock
//
//  Created by Jack Newcombe on 01/10/2020.
//

import Foundation

public protocol MiddlewareRequestContext: MockHttpRequest {
    var path: String { get }
    var queryParams: [(String, String)] { get }
    var method: String { get }
    var headers: [String : String] { get }
    var body: [UInt8] { get }
    var address: String? { get }
    var params: [String : String] { get }
}

public protocol MiddlewareResponseContext: class {
    var statusCode: Int { get set }
    var headers: [String: String] { get set }
    var responseBody: Data? { get set }
}

public protocol MiddlewareContext {
    var requestContext: MiddlewareRequestContext { get }
    var responseContext: MiddlewareResponseContext { get }
    var next: () -> Void { get }
}

public protocol Middleware {
    func execute(withContext context: MiddlewareContext)
}

class MiddlewareService {
    
    private struct _MiddlewareRequestContext: MiddlewareRequestContext, MockHttpRequest {
        let path: String
        let queryParams: [(String, String)]
        let method: String
        let headers: [String : String]
        let body: [UInt8]
        let address: String?
        let params: [String : String]
        
        init(request: MockNIOHTTPRequest) {
            self.path = request.path
            self.queryParams = request.queryParams
            self.method = request.method
            self.headers = request.headers
            self.body = request.body
            self.address = request.address
            self.params = request.params
        }
    }
    
    private class _MiddlewareResponseContext: MiddlewareResponseContext {
        var statusCode: Int = 0
        var headers: [String : String] = [:]
        var responseBody: Data? = nil
    }
    
    private struct _MiddlewareContext: MiddlewareContext {
        let requestContext: MiddlewareRequestContext
        let responseContext: MiddlewareResponseContext
        let next: () -> Void
    }
    
    private(set) var middleware: [Middleware] = []
        
    private var context: MiddlewareContext?
    
    func executeAll(forRequest request: MockNIOHTTPRequest) -> MiddlewareContext? {
        executeAll(forRequest: request, middleware: middleware)
    }
        
    private func executeAll(forRequest request: MockNIOHTTPRequest, middleware: [Middleware]) -> MiddlewareContext? {
        
        let requestContext = _MiddlewareRequestContext(request: request)
        let responseContext = _MiddlewareResponseContext()
        
        let context = _MiddlewareContext(requestContext: requestContext,
                                     responseContext: responseContext) {
            if (middleware.count - 1) > 0 {
                self.executeAll(forRequest: request, middleware: Array(middleware[1...]))
            }
        }
        
        middleware.first?.execute(withContext: context)
        
        return context
    }
    
    func add(middleware mdl: Middleware) {
        middleware.append(mdl)
    }
    
}
