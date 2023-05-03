//
//  ReviewDescription.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import SwiftUI

struct ReviewText: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.body)
    }
}

struct ReviewDescription_Previews: PreviewProvider {
    static var previews: some View {
        ReviewText(text: "This restaurant is on FIRE.  From the moment you walk in the door- you're the ultimate hipster and the staff give you the love like you are.  \n\nThe food is...")
    }
}
