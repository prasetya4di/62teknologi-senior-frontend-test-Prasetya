//
//  HomeView.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel: HomeViewModel
    
    @State private var searchText = ""
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                if viewModel.viewState.isLoading {
                    HomeLoading()
                } else {
                    SearchTextField(text: $searchText) {
                        viewModel.fetchSearchBusiness(key: searchText)
                    }
                    
                    BusinessList(
                        businesses: viewModel.viewState.businesses
                    )
                }
            }
        }
        .navigationTitle("Business")
        .padding()
        .onAppear {
            viewModel.fetchBusiness()
        }
    }
}
