//
//  ReviewViewState.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import Foundation

struct ReviewViewState: Equatable {
    var reviews: [Review] = []
    var isLoading = false
    var error: Error? = nil
    
    init(isLoading: Bool = false, error: Error? = nil) {
        self.isLoading = isLoading
        self.error = error
    }
    
    static func idle() -> ReviewViewState {
        ReviewViewState()
    }
    
    static func == (lhs: ReviewViewState, rhs: ReviewViewState) -> Bool {
        return lhs.reviews == rhs.reviews
        && lhs.isLoading == rhs.isLoading
        && lhs.error?.localizedDescription == rhs.error?.localizedDescription
    }
}
