//
//  FilterToolbarButton.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import SwiftUI

struct FilterToolbarButton: View {
    @Binding var showFilter: Bool
    
    var body: some View {
        Button {
            showFilter.toggle()
        } label: {
            Image(systemName: "line.horizontal.3.decrease.circle")
        }
    }
}

struct FilterToolbarButton_Previews: PreviewProvider {
    static var previews: some View {
        FilterToolbarButton(showFilter: .constant(false))
    }
}
