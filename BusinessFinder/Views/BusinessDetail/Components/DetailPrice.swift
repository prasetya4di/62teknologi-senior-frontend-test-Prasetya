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
        HStack(spacing: 0) {
            ForEach(1...5, id: \.self) { index in
                Text("$")
                    .foregroundColor(index > Int(price.count) ? .gray : .black)
            }
        }
    }
}

struct DetailPrice_Previews: PreviewProvider {
    static var previews: some View {
        DetailPrice(price: "$$")
    }
}
