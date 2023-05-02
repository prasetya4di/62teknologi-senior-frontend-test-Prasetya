//
//  NetworkManager.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import Alamofire
import Foundation

private let apiBaseUrl = "https://api.yelp.com/v3/businesses"

actor NetworkManager: GlobalActor {
    static let shared = NetworkManager()
    
    private init() {}
    
    private let maxWaitTime = 15.0
    var commonHeaders: HTTPHeaders = [
        "Authorization": "Bearer Ubf1-f0uqsJUnssqPMGo-tiFeZTT85oFmKfznlPmjDtX8s83jYMoAb-ApuD63wgq6LDZNsUXG6gurZIVYaj2jzxJmmLdCdXbDqIHU_b6KiCEVi8v-YB0OSsW6MWaY3Yx"
    ]
    
    func get<T: Decodable>(
        of type: T.Type = T.self,
        path: String,
        parameters: Parameters?) async throws -> T {
            return try await withCheckedThrowingContinuation { continuation in
                AF.request(
                    apiBaseUrl + path,
                    parameters: parameters,
                    headers: commonHeaders,
                    requestModifier: { $0.timeoutInterval = self.maxWaitTime }
                )
                .responseDecodable(of: type) { response in
                    switch(response.result) {
                    case let .success(data):
                        continuation.resume(returning: data)
                    case let .failure(error):
                        continuation.resume(throwing: self.handleError(error: error))
                    }
                }
            }
     }

    private func handleError(error: AFError) -> Error {
        if let underlyingError = error.underlyingError {
            let nserror = underlyingError as NSError
            let code = nserror.code
            if code == NSURLErrorNotConnectedToInternet ||
                code == NSURLErrorTimedOut ||
                code == NSURLErrorInternationalRoamingOff ||
                code == NSURLErrorDataNotAllowed ||
                code == NSURLErrorCannotFindHost ||
                code == NSURLErrorCannotConnectToHost ||
                code == NSURLErrorNetworkConnectionLost
            {
                var userInfo = nserror.userInfo
                userInfo[NSLocalizedDescriptionKey] = "Unable to connect to the server"
                let currentError = NSError(
                    domain: nserror.domain,
                    code: code,
                    userInfo: userInfo
                )
                return currentError
            }
        }
        return error
    }
}
