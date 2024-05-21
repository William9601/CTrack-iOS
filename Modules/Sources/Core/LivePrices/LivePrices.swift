//
//  LivePrices.swift
//
//
//  Created by William von Arend on 18/05/2024.
//

import SwiftUI
import Components
import Extensions

public struct LivePrices: View {
    // Because we use the DashboardModel in many views, instad of passing it from view to view with an ObservableObject, we will instead put it in the environment as an EnvironmentObject.
    @State private var showPortfolio = false
    
    public init() {}
    
    public var body: some View {
        ZStack {
            // background layer
            Color.theme.ctBackgroundColor
                .ignoresSafeArea()
            
            //content layer
            VStack {
                header
                List {
                    CoinRowView(coin: DeveloperPreview.instance.coin, showHoldingsColumn: false)
                }.listStyle(.plain)
                
                Spacer(minLength: 0)
            }
        }
    }
}

extension LivePrices {
    private var header: some View {
        HStack {
            withAnimation(.none) {
                CircleButton(iconName: showPortfolio ? "plus" : "info")
                    .background(
                        CircleButtonAnimation(animate: $showPortfolio)
                    )
            }
            
            Spacer()
            withAnimation(.none) {
                Text(showPortfolio ? "Portfolio" :"Live Prices")
                    .font(.headline)
                    .fontWeight(.heavy)
                    .foregroundColor(.theme.ctAccent)
            }
            Spacer()
            CircleButton(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring) {
                        showPortfolio.toggle()
                    }
                }
        }.padding(.horizontal, .ctSpace3)
    }
} 
