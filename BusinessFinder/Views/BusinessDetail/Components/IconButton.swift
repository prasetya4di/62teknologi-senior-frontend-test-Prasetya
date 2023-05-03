//
//  IconButton.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import SwiftUI

struct IconButton: View {
    let label: String
    let icon: String
    let onClick: () -> Void
    
    var body: some View {
        Button(action: onClick) {
            VStack(spacing: 8) {
                Image(systemName: icon)
                Text(label)
                    .font(.caption)
            }
            .foregroundColor(.gray)
        }
    }
}

struct IconButton_Previews: PreviewProvider {
    static var previews: some View {
        IconButton(
            label: "call", icon: "phone.fill") { }
    }
}
