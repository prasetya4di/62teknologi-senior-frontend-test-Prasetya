//
//  EmptyBusinessText.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import SwiftUI

struct EmptyBusinessText: View {
    var body: some View {
        VStack {
            Spacer()
            Text("Ooppss.. we can't find business near you, pelase try to move or change the keyowrd :)")
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
            Spacer()
        }
    }
}

struct EmptyBusinessText_Previews: PreviewProvider {
    static var previews: some View {
        EmptyBusinessText()
    }
}
