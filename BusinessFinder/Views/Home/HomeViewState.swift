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
    var isNearbyLocationOn = false
    var isOnlyOpenStore = false
    var isCanLoadMore = true
    var selectedPrice: String = ""
    var selectedSortOption: SortOption?
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
        && lhs.isNearbyLocationOn == rhs.isNearbyLocationOn
        && lhs.isOnlyOpenStore == rhs.isOnlyOpenStore
        && lhs.selectedPrice == rhs.selectedPrice
        && lhs.selectedSortOption == rhs.selectedSortOption
        && lhs.error?.localizedDescription == rhs.error?.localizedDescription
    }
    
    var filters: [String: Any] {
        var parameters: [String: Any] = [:]
        
        parameters["open_now"] = isOnlyOpenStore
        
        if !searchKey.isEmpty {
            parameters["term"] = searchKey
        }
        
        if let selectedSortOption {
            parameters["sort_by"] = selectedSortOption.value
        }
        
        if !selectedPrice.isEmpty {
            parameters["price"] = "\(selectedPrice.count)"
        }
        
        return parameters
    }
}
