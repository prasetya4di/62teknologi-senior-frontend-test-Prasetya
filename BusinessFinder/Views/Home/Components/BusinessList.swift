//
//  BusinessList.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import SwiftUI

struct BusinessList: View {
    
    @EnvironmentObject private var viewModel: HomeViewModel
    
    private var businesses: [Business] {
        viewModel.viewState.businesses
    }
    
    var body: some View {
        LazyVStack {
            ForEach(businesses, id: \.id) { business in
                NavigationLink {
                    BusinessDetail(
                        id: business.id,
                        name: business.name
                    )
                } label: {
                    BusinessItem(
                        business: business
                    )
                    .onAppear {
                        guard business == businesses.last
                                && !viewModel.viewState.isLoadMore
                                && viewModel.viewState.isCanLoadMore else {
                            return
                        }
                        
                        viewModel.loadMoreData()
                    }
                }
                .buttonStyle(.plain)
            }
            
            if viewModel.viewState.isLoadMore {
                ProgressView()
                    .padding()
            } else if !viewModel.viewState.isCanLoadMore {
                EndOfDataText()
            }
        }
    }
}
