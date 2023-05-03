//
//  DetailOpenHour.swift
//  BusinessFinder
//
//  Created by Prasetya on 03/05/23.
//

import SwiftUI

struct DetailOpenHour: View {
    let businessHours: BusinessHours

    var body: some View {
        HStack(spacing: 2) {
            Text(businessHours.isOpenNow ? "Open" : "Close")
                .font(.caption)
                .fontWeight(.bold)
                .foregroundColor(businessHours.isOpenNow ? .green : .red)
        }
    }
}

struct DetailOpenHour_Previews: PreviewProvider {
    static var previews: some View {
        DetailOpenHour(
            businessHours: BusinessHours(
                hourType: "Regular",
                open: [
                    BusinessOpen(
                        day: 0,
                        start: "1600",
                        end: "2000",
                        isOvernight: false
                    ),
                    BusinessOpen(
                        day: 1,
                        start: "1600",
                        end: "2000",
                        isOvernight: false
                    ),
                    BusinessOpen(
                        day: 2,
                        start: "1600",
                        end: "2000",
                        isOvernight: false
                    ),
                    BusinessOpen(
                        day: 3,
                        start: "1600",
                        end: "2000",
                        isOvernight: false
                    ),
                    BusinessOpen(
                        day: 4,
                        start: "1600",
                        end: "0100",
                        isOvernight: true
                    ),
                    BusinessOpen(
                        day: 5,
                        start: "1600",
                        end: "0100",
                        isOvernight: true
                    ),
                    BusinessOpen(
                        day: 6,
                        start: "1600",
                        end: "2000",
                        isOvernight: false
                    ),
                ],
                isOpenNow: false
            )
        )
    }
}
