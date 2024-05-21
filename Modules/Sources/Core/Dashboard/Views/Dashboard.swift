//
//  Dashboard.swift
//
//
//  Created by William von Arend on 09/05/2024.
//

import SwiftUI
import Components

public struct Dashboard: View {
    @EnvironmentObject private var vm: DashboardViewModel
    
    public init() {}
    public var body: some View {
        VStack {
            TotalBox()
            PortfolioBox()
            Spacer()
        }
    }
}

struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard()
            .environmentObject(DashboardViewModel())
    }
}
