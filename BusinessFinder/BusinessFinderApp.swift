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
    
    init() {
        let networkManager = NetworkManager.shared
        let businessService: BusinessService =
            BusinessServiceImpl(networkManager: networkManager)
        let businessRepository: BusinessRepository =
            BusinessRepositoryImpl(businessService: businessService)
        let getBusiness: GetBusiness =
            GetBusinessImpl(businessRepository: businessRepository)
        _homeViewModel = StateObject(wrappedValue: HomeViewModel(getBusiness: getBusiness))
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(homeViewModel)
        }
    }
}
