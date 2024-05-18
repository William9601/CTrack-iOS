//
//  LivePrices.swift
//
//
//  Created by William von Arend on 18/05/2024.
//

import SwiftUI
import Components

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
                }
                Spacer(minLength: 0)
            }.padding(.horizontal, .ctSpace3)
        }
    }
}
