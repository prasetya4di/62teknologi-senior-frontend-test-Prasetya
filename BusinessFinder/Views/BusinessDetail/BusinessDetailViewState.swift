//
//  BusinessViewState.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import Foundation

struct BusinessDetailViewState: Equatable {
    var business: Business? = nil
    var isLoading = false
    var error: Error? = nil
    
    init(business: Business? = nil, isLoading: Bool = false, error: Error? = nil) {
        self.business = business
        self.isLoading = isLoading
        self.error = error
    }
    
    static func idle() -> BusinessDetailViewState {
        BusinessDetailViewState()
    }
    
    static func == (lhs: BusinessDetailViewState, rhs: BusinessDetailViewState) -> Bool {
        return lhs.business == rhs.business
        && lhs.isLoading == rhs.isLoading
        && lhs.error?.localizedDescription == rhs.error?.localizedDescription
    }
}
