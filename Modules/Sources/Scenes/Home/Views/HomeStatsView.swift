//
//  HomeStatsView.swift
//
//
//  Created by William von Arend on 08/07/2024.
//

import SwiftUI
import Components
import Models

struct HomeStatsView: View {

    @EnvironmentObject private var vm: HomeViewModel
    
    @Binding var showPortfolio: Bool
    
    var body: some View {
        HStack {
            ForEach(vm.statistics) { stat in
                StatisticsData(stat: stat)
                    .frame(width: UIScreen.main.bounds.width / 3)
            }
        }.frame(width: UIScreen.main.bounds.width,
                alignment: showPortfolio ? .trailing : .leading) // The Portfolio Value is outside the frame. Once we change the alignment to trailing, it slides it into the screen
    }
}

//struct HomeStatsView_Previews: PreviewProvider {
//    static var previews: some View {
//        HomeStatsView(showPortfolio: .constant(false))
//    }
//}
