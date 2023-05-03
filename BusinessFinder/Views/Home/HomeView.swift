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
    @State private var showFilter = false
    
    var body: some View {
        ScrollView(showsIndicators: false) {
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
        .padding(.horizontal)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                FilterToolbarButton(showFilter: $showFilter)
            }
        }
        .sheet(isPresented: $showFilter) {
            FilterView(
                isShow: $showFilter
            )
        }
        .onAppear {
            viewModel.fetchBusiness()
        }
    }
}
