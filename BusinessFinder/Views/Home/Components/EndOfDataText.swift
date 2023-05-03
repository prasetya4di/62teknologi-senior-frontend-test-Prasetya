//
//  EndOfDataText.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import SwiftUI

struct EndOfDataText: View {
    var body: some View {
        Text("You are at the end of the page, Try to search another keyword :)")
            .foregroundColor(.gray)
            .multilineTextAlignment(.center)
    }
}

struct EndOfDataText_Previews: PreviewProvider {
    static var previews: some View {
        EndOfDataText()
    }
}
