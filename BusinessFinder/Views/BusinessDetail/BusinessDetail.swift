//
//  BusinessDetail.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import SwiftUI

struct BusinessDetail: View {
    let id: String
    let name: String
    
    @EnvironmentObject private var viewModel: BusinessDetailViewModel
    
    
    var body: some View {
        ScrollView {
            VStack {
                if viewModel.viewState.isLoading {
                    BusinessDetailLoading()
                } else {
                    if let business = viewModel.viewState.business {
                        BusinessInformation(business: business)
                    }
                }
                
                ReviewView(id: id)
                    .padding(.horizontal)
            }
        }
        .onAppear {
            viewModel.fetchBusinessDetail(id: id)
        }
        .navigationTitle(name)
        .navigationBarTitleDisplayMode(.inline)
    }
}
