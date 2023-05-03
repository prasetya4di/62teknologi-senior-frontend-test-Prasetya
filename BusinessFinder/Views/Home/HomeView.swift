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
                
                SearchTextField(text: $searchText) {
                    viewModel.fetchSearchBusiness(key: searchText)
                }
                
                if viewModel.viewState.isLoading {
                    HomeLoading()
                } else {
                    
                    if viewModel.viewState.businesses.isEmpty {
                        EmptyBusinessText()
                    } else {
                        BusinessList()
                    }
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
