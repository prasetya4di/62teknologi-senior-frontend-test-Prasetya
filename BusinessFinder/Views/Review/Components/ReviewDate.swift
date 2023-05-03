//
//  ReviewDate.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import SwiftUI

struct ReviewDate: View {
    let date: String
    
    var body: some View {
        Text(parseDate(date))
            .font(.caption2)
            .foregroundColor(.gray)
    }
    
    func parseDate(_ date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss"
        if let date = dateFormatter.date(from: date) {
            dateFormatter.dateFormat = "dd MMMM yyyy"
            let formattedDate = dateFormatter.string(from: date)
            return formattedDate
        } else {
            return ""
        }
    }
}

struct ReviewDate_Previews: PreviewProvider {
    static var previews: some View {
        ReviewDate(date: "2023-03-31 10:46:13")
    }
}
