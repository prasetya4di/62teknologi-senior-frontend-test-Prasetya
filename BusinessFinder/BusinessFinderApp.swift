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
    @StateObject private var filterViewModel: FilterViewModel
    
    init() {
        let networkManager = NetworkManager.shared
        let businessService: BusinessService =
            BusinessServiceImpl(networkManager: networkManager)
        let sortOptionDao: SortOptionDao = SortOptionDaoImpl()
        
        let businessRepository: BusinessRepository =
            BusinessRepositoryImpl(businessService: businessService)
        let filterRepository: FilterRepostory =
            FilterRepositoryImpl(sortOptionDao: sortOptionDao)
        
        let getBusiness: GetBusiness =
            GetBusinessImpl(businessRepository: businessRepository)
        let getBusinessDetail: GetBusinessDetail =
            GetBusinessDetailImpl(businessRepository: businessRepository)
        let getReviews: GetBusinessReviews =
            GetBusinessReviewsImpl(businessRepository: businessRepository)
        let getSortOption: GetSortOptions =
            GetSortOptionsImpl(repository: filterRepository)
        
        _homeViewModel =
            StateObject(
                wrappedValue: HomeViewModel(
                    getBusiness: getBusiness
                ))
        _businessDetailViewModel =
            StateObject(
                wrappedValue: BusinessDetailViewModel(
                    getBusinessDetail: getBusinessDetail))
        _reviewViewModel =
            StateObject(
                wrappedValue: ReviewViewModel(
                    getReviews: getReviews))
        _filterViewModel = StateObject(
            wrappedValue: FilterViewModel(
                getSortOptions: getSortOption))
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(homeViewModel)
                .environmentObject(businessDetailViewModel)
                .environmentObject(reviewViewModel)
                .environmentObject(filterViewModel)
        }
    }
}
