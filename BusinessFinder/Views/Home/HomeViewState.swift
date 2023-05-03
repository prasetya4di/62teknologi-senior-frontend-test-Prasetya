//
//  HomeViewState.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import Foundation

struct HomeViewState: Equatable {
    var isLoading = false
    var isLoadMore = false
    var businesses: [Business]
    var location: String = Locale.current.language.region?.identifier ?? "ID"
    var limit: Int = 20
    var searchKey: String = ""
    var offset = 0
    var error: Error? = nil
    
    init() {
        businesses = []
    }
    
    static func idle() -> HomeViewState {
        HomeViewState()
    }
    
    static func == (lhs: HomeViewState, rhs: HomeViewState) -> Bool {
        return lhs.businesses == rhs.businesses
        && lhs.location == rhs.location
        && lhs.searchKey == rhs.searchKey
        && lhs.offset == rhs.offset
        && lhs.isLoading == rhs.isLoading
        && lhs.isLoadMore == rhs.isLoadMore
        && lhs.error?.localizedDescription == rhs.error?.localizedDescription
    }
}
