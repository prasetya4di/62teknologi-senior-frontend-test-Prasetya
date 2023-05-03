//
//  SortByPicker.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import SwiftUI

struct SortByPicker: View {
    @Binding var selection: SortOption
    let sortOptions: [SortOption]
    
    var body: some View {
        HStack {
            Text("Sort By")
            Spacer()
            Picker(selection: $selection, label: Text("")) {
                ForEach(sortOptions) { option in
                    Text(option.label).tag(option.value)
                }
            }
        }
    }
}

struct SortByPicker_Previews: PreviewProvider {
    static var previews: some View {
        let sortOptions = [
            SortOption(label: "Best Match", value: "best_match"),
            SortOption(label: "Rating", value: "rating"),
            SortOption(label: "Review Count", value: "review_count"),
        ]
        
        SortByPicker(
            selection: .constant(sortOptions.first!),
            sortOptions: sortOptions
        )
    }
}
