//
//  HomeView.swift
//
//
//  Created by William von Arend on 18/05/2024.
//

import SwiftUI
import Components

public struct HomeView: View {
    @EnvironmentObject private var vm: HomeViewModel // Because we use the HomeViewModel in many views, instad of passing it from view to view with an ObservableObject, we will instead put it in the environment as an EnvironmentObject.
    @State private var showPortfolio = false // animate right
    @State private var showPortfolioView: Bool = false // new sheet
    
    public init() {}
    
    public var body: some View {
        ZStack {
            // background layer
            Color.theme.ctBackgroundColor
                .ignoresSafeArea()
                .sheet(isPresented: $showPortfolioView) {
                    PortfolioView()
                        .environmentObject(vm)
                }
            
            //content layer
            VStack {
                header
                
                HomeStatsView(showPortfolio: $showPortfolio)
                
                CTSearchBar(searchText: $vm.searchText)
                    .padding(.ctDimensions.space3)

                columnTitles
                
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

extension HomeView {
    private var header: some View {
        HStack {
            withAnimation(.none) {
                CircleButton(iconName: showPortfolio ? "plus" : "info")
                    .onTapGesture {
                        if showPortfolio {
                            showPortfolioView.toggle()
                        }
                    }
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
        }.padding(.horizontal, .ctDimensions.space3)
    }
    
    private var allCoinsList: some View {
        List {
            ForEach(vm.allCoins) { coin in
                CoinRowView(coin: coin, showHoldingsColumn: false)
                    .listRowInsets(.init(top: .ctDimensions.space4,
                                         leading: .ctDimensions.space0,
                                         bottom: .ctDimensions.space4,
                                         trailing: .ctDimensions.space4))
            }
        }
        .listStyle(.plain)
    }
    
    private var portfolioCoinsList: some View {
        List {
            ForEach(vm.portfolioCoins) { coin in
                CoinRowView(coin: coin, showHoldingsColumn: true)
                    .listRowInsets(.init(top: .ctDimensions.space4,
                                         leading: .ctDimensions.space0,
                                         bottom: .ctDimensions.space4,
                                         trailing: .ctDimensions.space4))
            }
        }
        .listStyle(.plain)
    }
    
    private var columnTitles: some View {
        HStack {
            Text("Coin")
            Spacer()
            if showPortfolio {
                Text("Holdings")
            }
            Text("Price")
                .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
        }
        .font(.caption)
        .foregroundColor(.theme.ctSecondaryText)
        .padding(.horizontal, .ctDimensions.space3)
    }
}
