//
//  FilterViewState.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import Foundation

struct FilterViewState: Equatable {
    var isNearbyLocationOn = false
    var isOnlyOpenStore = false
    var selectedPrice: String = ""
    var selectedSortOption: SortOption?
    var sortOptions: [SortOption]
    
    init() {
        self.sortOptions = []
    }
    
    static func idle() -> FilterViewState {
        FilterViewState()
    }
    
    static func == (lhs: FilterViewState, rhs: FilterViewState) -> Bool {
        return lhs.sortOptions == rhs.sortOptions
        && lhs.isNearbyLocationOn == rhs.isNearbyLocationOn
        && lhs.isOnlyOpenStore == rhs.isOnlyOpenStore
        && lhs.selectedPrice == rhs.selectedPrice
        && lhs.selectedSortOption == rhs.selectedSortOption
    }
}
