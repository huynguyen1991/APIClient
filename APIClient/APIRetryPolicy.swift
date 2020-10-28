//
//  APIRetryPolicy.swift
//  ProApp
//
//  Created by Huy Nguyễn on 4/7/20.
//  Copyright © 2020 Huy Nguyễn. All rights reserved.
//

import Foundation
import Alamofire

open class APIRetryPolicy: RetryPolicy {
    /// Creates a `ConnectionLostRetryPolicy` instance from the specified parameters.
    ///
    /// - Parameters:
    ///   - retryLimit:              The total number of times the request is allowed to be retried.
    ///                              `RetryPolicy.defaultRetryLimit` by default.
    ///   - exponentialBackoffBase:  The base of the exponential backoff policy.
    ///                              `RetryPolicy.defaultExponentialBackoffBase` by default.
    ///   - exponentialBackoffScale: The scale of the exponential backoff.
    ///                              `RetryPolicy.defaultExponentialBackoffScale` by default.
    ///   - retryableHTTPMethods:    The idempotent http methods to retry.
    ///                              `RetryPolicy.defaultRetryableHTTPMethods` by default.
    public init(retryLimit: UInt = RetryPolicy.defaultRetryLimit,
                exponentialBackoffBase: UInt = RetryPolicy.defaultExponentialBackoffBase,
                exponentialBackoffScale: Double = RetryPolicy.defaultExponentialBackoffScale,
                retryableHTTPMethods: Set<HTTPMethod> = RetryPolicy.defaultRetryableHTTPMethods) {
        super.init(retryLimit: retryLimit,
                   exponentialBackoffBase: exponentialBackoffBase,
                   exponentialBackoffScale: exponentialBackoffScale,
                   retryableHTTPMethods: retryableHTTPMethods,
                   retryableHTTPStatusCodes: [200],
                   retryableURLErrorCodes: [.networkConnectionLost,
                                            .timedOut])
    }
}
