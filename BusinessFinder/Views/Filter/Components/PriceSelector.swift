//
//  PriceSelector.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import SwiftUI

struct PriceSelector: View {
    @EnvironmentObject private var viewModel: FilterViewModel
    @Binding var selectedPrice: String
    
    var body: some View {
        HStack(spacing: 2){
            Text("Price")
            Spacer()
            ForEach(1...5, id: \.self) { index in
                Text("$")
                    .foregroundColor(
                        index > Int(selectedPrice.count)
                        ? .gray
                        : .black
                    )
                    .onTapGesture {
                        selectedPrice = String(repeating: "$", count: index)
                        print("Selected price : \(selectedPrice)")
                    }
            }
        }
        .onChange(of: selectedPrice) { newValue in
            viewModel.changePrice(selected: newValue)
        }
    }
}

struct PriceSelector_Previews: PreviewProvider {
    static var previews: some View {
        PriceSelector(selectedPrice: .constant("$$$"))
    }
}
