//
//  HomeViewState.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import Foundation

struct HomeViewState: Equatable {
    var businesses: [Business]
    var error: Error? = nil
    
    init() {
        businesses = []
    }
    
    static func idle() -> HomeViewState {
        HomeViewState()
    }
    
    static func == (lhs: HomeViewState, rhs: HomeViewState) -> Bool {
        return lhs.businesses == rhs.businesses
        && lhs.error?.localizedDescription == rhs.error?.localizedDescription
    }
}