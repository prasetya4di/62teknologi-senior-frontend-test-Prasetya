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
                Text("Business")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                if viewModel.viewState.isLoading {
                    HomeLoading()
                } else {
                    SearchTextField(text: $searchText) {
                       
                    }
                    
                    BusinessList(
                        businesses: viewModel.viewState.businesses
                    )
                }
            }
        }
        .padding()
        .onAppear {
            viewModel.fetchBusiness()
        }
    }
}
