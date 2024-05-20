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
                CoinRowView(coin: DeveloperPreview.instance.coin, showHoldingsColumn: false)
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
