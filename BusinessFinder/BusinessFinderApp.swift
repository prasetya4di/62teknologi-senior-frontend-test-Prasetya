//
//  BusinessFinderApp.swift
//  BusinessFinder
//
//  Created by Prasetya on 02/05/23.
//

import SwiftUI

@main
struct BusinessFinderApp: App {
    @StateObject private var homeViewModel: HomeViewModel
    @StateObject private var businessDetailViewModel: BusinessDetailViewModel
    @StateObject private var reviewViewModel: ReviewViewModel
    
    init() {
        let networkManager = NetworkManager.shared
        let businessService: BusinessService =
            BusinessServiceImpl(networkManager: networkManager)
        let businessRepository: BusinessRepository =
            BusinessRepositoryImpl(businessService: businessService)
        let getBusiness: GetBusiness =
            GetBusinessImpl(businessRepository: businessRepository)
        let getBusinessDetail: GetBusinessDetail =
            GetBusinessDetailImpl(businessRepository: businessRepository)
        let getReviews: GetBusinessReviews =
            GetBusinessReviewsImpl(businessRepository: businessRepository)
        let searchBusiness: SearchBusiness =
            SearchBusinessImpl(repository: businessRepository)
        let loadMoreBusiness: LoadMoreBusiness =
            LoadMoreBusinessImpl(businessRepository: businessRepository)
        _homeViewModel =
            StateObject(
                wrappedValue: HomeViewModel(
                    getBusiness: getBusiness,
                    searchBusiness: searchBusiness,
                    loadMoreBusiness: loadMoreBusiness
                ))
        _businessDetailViewModel =
            StateObject(
                wrappedValue: BusinessDetailViewModel(
                    getBusinessDetail: getBusinessDetail))
        _reviewViewModel =
            StateObject(
                wrappedValue: ReviewViewModel(
                    getReviews: getReviews))
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(homeViewModel)
                .environmentObject(businessDetailViewModel)
                .environmentObject(reviewViewModel)
        }
    }
}
