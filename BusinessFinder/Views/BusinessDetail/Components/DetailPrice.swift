//
//  DetailPrice.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import SwiftUI

struct DetailPrice: View {
    let price: String
    
    var body: some View {
        HStack {
            ForEach(1...5, id: \.self) { index in
                Text("$")
                    .foregroundColor(index > Int(price.count) ? .gray : .black)
                    .padding(.horizontal, -4)
            }
        }
    }
}

struct DetailPrice_Previews: PreviewProvider {
    static var previews: some View {
        DetailPrice(price: "$$")
    }
}
