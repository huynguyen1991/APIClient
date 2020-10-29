//
//  APIClientTests.swift
//  APIClientTests
//
//  Created by NTQ on 10/28/20.
//

import XCTest
@testable import APIClient
@testable import Shock
@testable import Alamofire
class APIClientTests: XCTestCase {
    var server: MockServer!
    var requestsCache = RequestsCache()
    
    struct RequestsCache {
        var cache: [(route: MockHTTPRoute, request: CacheableRequest)] = []
    }
    
    override func setUp() {
        super.setUp()
        server = MockServer(portRange: 9090...9099, bundle: Bundle(for: APIClientTests.self))
        server.shouldSendNotFoundForMissingRoutes = true
        server.start()
        server.onRequestReceived = { route, request in
            self.requestsCache.cache.append((route, request))
        }
        
        APIClient.share.config = Config()
    }
    
    override func tearDown() {
        server.stop()
        super.tearDown()
    }
    
    func testCallAPI() {
//        let route: MockHTTPRoute = .simple(method: .get, urlPath: "/simple", code: 200, filename: "")
//        server.setup(route: route)
////        let request = AF.request("\(server.hostURL)/detailPicture")
////           request.responseJSON { (data) in
////             print(data)
////           }
//
        let urlString = "\(server.hostURL)/simple"
           let expectation = self.expectation(description: "request should succeed")
//
//           AF.request(urlString).responseString { resp in
////               expectation.fulfill()
//           }
        
        
        let route: MockHTTPRoute = .simple(method: .get, urlPath: "/detailPicture", code: 200, filename: "")
        server.setup(route: route)

        let featureModel = FeatureModel()
        featureModel.fetchDataComplete = {
            expectation.fulfill()
        }

        featureModel.fetchData()
    }
    
//    func testGetApiCallRequestData() {
//        let route: MockHTTPRoute = .simple(method: .get, urlPath: "/simple", code: 200, filename: "testSimpleRoute.txt")
//        server.setup(route: route)
//        
//        let expectation = self.expectation(description: "Expect 200 response with response body")
//
//        HTTPClient.get(url: "\(server.hostURL)/simple") { code, body, headers, error in
//            XCTAssertEqual(code, 200)
//            XCTAssertEqual(body, "testSimpleRoute test fixture\n")
//            expectation.fulfill()
//        }
//        self.waitForExpectations(timeout: 2.0, handler: nil)
//
//        // Check if the API call request data is accessible
//        for (route, request) in requestsCache.cache{
//            XCTAssertTrue(route.urlPath == "/simple")
//            XCTAssertTrue(request.path == "/simple")
//        }
//    }
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
