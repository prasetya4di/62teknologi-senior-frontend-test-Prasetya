//
//  BusinessService.swift
//  BusinessFinder
//
//  Created by Prasetya on 02/05/23.
//

import Alamofire

protocol BusinessService {
    func getBusiness() -> DataResponsePublisher<BusinessResponse>
}

class BussinessServiceImpl: BusinessService {
    func getBusiness() -> Alamofire.DataResponsePublisher<BusinessResponse> {
        AF.request("https://api.yelp.com/v3/businesses/search")
            .publishDecodable(type: BusinessResponse.self)
    }
}
