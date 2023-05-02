//
//  BusinessService.swift
//  BusinessFinder
//
//  Created by Prasetya on 02/05/23.
//

import Alamofire

protocol BusinessService {
    func getBusiness(location: String) -> DataResponsePublisher<BusinessResponse>
}

class BusinessServiceImpl: BusinessService {
    func getBusiness(location: String) -> DataResponsePublisher<BusinessResponse> {
        AF.request(
            "https://api.yelp.com/v3/businesses/search",
            parameters: [
                "location": location
            ],
            headers: ["Authorization": "Bearer Ubf1-f0uqsJUnssqPMGo-tiFeZTT85oFmKfznlPmjDtX8s83jYMoAb-ApuD63wgq6LDZNsUXG6gurZIVYaj2jzxJmmLdCdXbDqIHU_b6KiCEVi8v-YB0OSsW6MWaY3Yx",]
        )
        .publishDecodable(type: BusinessResponse.self)
    }
}
