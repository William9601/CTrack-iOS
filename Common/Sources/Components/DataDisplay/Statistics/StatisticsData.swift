//
//  StatisticsData.swift
//
//
//  Created by William von Arend on 05/07/2024.
//

import SwiftUI
import Models

public struct StatisticsData: View {

    private let stat: StatisticsModel
    
    public init(stat: StatisticsModel) {
        self.stat = stat
    }

    public var body: some View {
        VStack(alignment: .leading, spacing: 4)  {
            Text(stat.title)
                .font(.caption)
                .foregroundColor(.theme.ctSecondaryText)
            Text(stat.value)
                .font(.headline)
                .foregroundColor(.theme.ctAccent)
            HStack(spacing: 4) {
                Image(systemName: "triangle.fill")
                    .font(.caption2)
                    .rotationEffect(
                        Angle(degrees: (stat.percentageChange ?? 0) >= 0 ? 0 : 180))
                Text(stat.percentageChange?.asPercentString() ?? "")
                    .font(.caption)
                .bold()
            }
            .foregroundColor((stat.percentageChange ?? 0) >= 0 ? Color.theme.ctGreen : Color.theme.ctRed)
            .opacity(stat.percentageChange == nil ? 0.0 : 1.0)
        }
    }
}

struct StatisticsData_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StatisticsData(stat: dev.stat1)
                .previewLayout(.sizeThatFits)
            StatisticsData(stat: dev.stat2)
                .previewLayout(.sizeThatFits)
            StatisticsData(stat: dev.stat3)
                .previewLayout(.sizeThatFits)
            StatisticsData(stat: dev.stat1)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
            StatisticsData(stat: dev.stat2)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
            StatisticsData(stat: dev.stat3)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}
