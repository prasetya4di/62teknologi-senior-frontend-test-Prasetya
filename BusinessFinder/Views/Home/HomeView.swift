//
//  HomeView.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Business")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            BusinessList(
                businesses: viewModel.viewState.businesses
            )
        }
        .padding()
        .onAppear {
            viewModel.fetchBusiness()
        }
    }
}
