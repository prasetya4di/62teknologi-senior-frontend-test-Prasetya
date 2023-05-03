//
//  OnlyOpenStoreToggle.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import SwiftUI

struct OnlyOpenStoreToggle: View {
    @Binding var isOn: Bool
    
    var body: some View {
        Toggle(isOn: $isOn) {
            Text("Open Store")
        }
    }
}

struct OnlyOpenStoreToggle_Previews: PreviewProvider {
    static var previews: some View {
        OnlyOpenStoreToggle(
            isOn: .constant(true)
        )
    }
}
