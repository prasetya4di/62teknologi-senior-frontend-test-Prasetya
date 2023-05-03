//
//  HomeLoading.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import SwiftUI

struct HomeLoading: View {
    var body: some View {
        VStack {
            HomeLoadingItem()
            HomeLoadingItem()
            HomeLoadingItem()
            HomeLoadingItem()
            HomeLoadingItem()
        }
    }
}

struct HomeLoading_Previews: PreviewProvider {
    static var previews: some View {
        HomeLoading()
    }
}
