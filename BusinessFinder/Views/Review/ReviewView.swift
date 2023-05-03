//
//  ReviewView.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import SwiftUI

struct ReviewView: View {
    let id: String
    @EnvironmentObject private var viewModel: ReviewViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Reviews")
                .font(.title)
                .fontWeight(.bold)
            
            Divider()
            
            if viewModel.viewState.isLoading {
                ReviewLoading()
            } else {
                ReviewList(review: viewModel.viewState.reviews)
            }
        }
        .onAppear {
            viewModel.fetchReviews(id: id)
        }
    }
}
