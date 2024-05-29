//
//  LivePrices.swift
//
//
//  Created by William von Arend on 18/05/2024.
//

import SwiftUI
import Components

public struct LivePrices: View {
    @EnvironmentObject private var vm: DashboardViewModel // Because we use the DashboardModel in many views, instad of passing it from view to view with an ObservableObject, we will instead put it in the environment as an EnvironmentObject.
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
                if !showPortfolio {
                    allCoinsList
                        .transition(.move(edge: .leading))
                }
                if showPortfolio {
                    portfolioCoinsList
                        .transition(.move(edge: .trailing))
                }
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
    
    private var allCoinsList: some View {
        List {
            ForEach(vm.allCoins) { coin in
                CoinRowView(coin: coin, showHoldingsColumn: false)
                    .listRowInsets(.init(top: .ctSpace4,
                                         leading: .ctSpace0,
                                         bottom: .ctSpace4,
                                         trailing: .ctSpace4))
            }
        }
        .listStyle(.plain)
    }
    
    private var portfolioCoinsList: some View {
        List {
            ForEach(vm.portfolioCoins) { coin in
                CoinRowView(coin: coin, showHoldingsColumn: true)
                    .listRowInsets(.init(top: .ctSpace4,
                                         leading: .ctSpace0,
                                         bottom: .ctSpace4,
                                         trailing: .ctSpace4))
            }
        }
        .listStyle(.plain)
    }
}
