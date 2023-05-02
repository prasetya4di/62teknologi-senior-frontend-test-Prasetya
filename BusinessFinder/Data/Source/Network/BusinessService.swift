//
//  BusinessService.swift
//  BusinessFinder
//
//  Created by Prasetya on 02/05/23.
//

import Alamofire

protocol BusinessService {
    func getBusiness(location: String) async throws -> BusinessResponse
}

class BusinessServiceImpl: BusinessService {
    private let networkManager: NetworkManager
    
    init(networkManager: NetworkManager) {
        self.networkManager = networkManager
    }
    
    func getBusiness(location: String) async throws -> BusinessResponse {
        try await self.networkManager.get(
            of: BusinessResponse.self,
            path: "/search",
            parameters: [
                "location": location
            ])
    }
}
