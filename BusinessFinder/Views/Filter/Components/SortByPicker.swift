//
//  SortByPicker.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import SwiftUI

struct SortByPicker: View {
    @EnvironmentObject private var viewModel: FilterViewModel
    @Binding var selection: SortOption
    let sortOptions: [SortOption]
    
    var body: some View {
        HStack {
            Text("Sort By")
            Spacer()
            Picker(selection: $selection, label: Text("")) {
                ForEach(sortOptions) { option in
                    Text(option.label).tag(option)
                }
            }
        }
        .onChange(of: selection) { newValue in
            viewModel.changeSortOption(newValue)
        }
    }
}
