//
//  ReviewLoading.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import SwiftUI
import SwiftUI_Shimmer

struct ReviewLoading: View {
    var body: some View {
        VStack {
            ReviewLoadingItem()
            ReviewLoadingItem()
            ReviewLoadingItem()
            ReviewLoadingItem()
            ReviewLoadingItem()
        }
    }
}

struct ReviewLoading_Previews: PreviewProvider {
    static var previews: some View {
        ReviewLoading()
    }
}
