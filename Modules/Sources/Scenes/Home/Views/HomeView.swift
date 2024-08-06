//
//  HomeView.swift
//
//
//  Created by William von Arend on 18/05/2024.
//

import SwiftUI
import Components
import Models

public struct HomeView: View {
    @EnvironmentObject private var vm: HomeViewModel // Because we use the HomeViewModel in many views, instad of passing it from view to view with an ObservableObject, we will instead put it in the environment as an EnvironmentObject.
    @State private var showPortfolio = false // animate right
    @State private var showPortfolioView: Bool = false // new sheet
    @State private var selectCoin: CoinModel? = nil
    @State private var showDetailView: Bool = false
    
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
        .background(            
            NavigationLink(
                destination: DetailLoadingView(coin: $selectCoin),
                isActive: $showDetailView,
                label: {
                    EmptyView()
                })
        )
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
                    .onTapGesture {
                        segue(coin: coin)
                    }
            }
        }
        .listStyle(.plain)
    }
    
    private func segue(coin: CoinModel) {
        selectCoin = coin
        showDetailView.toggle()
    }
    
    private var portfolioCoinsList: some View {
        List {
            ForEach(vm.portfolioCoins) { coin in
                CoinRowView(coin: coin, showHoldingsColumn: true)
                    .listRowInsets(.init(top: .ctDimensions.space4,
                                         leading: .ctDimensions.space0,
                                         bottom: .ctDimensions.space4,
                                         trailing: .ctDimensions.space4))
                    .onTapGesture {
                        segue(coin: coin)
                    }
            }
        }
        .listStyle(.plain)
    }
    
    private var columnTitles: some View {
        HStack {
            HStack(spacing: 4) {
                Text("Coin")
                Image(systemName: "chevron.down")
                    .opacity((vm.sortOption == .rank || vm.sortOption == .rankReversed) ? 1.0 : 0.0)
                    .rotationEffect(Angle(degrees: vm.sortOption == .rank ? 0 : 180))
            }
            .onTapGesture {
                withAnimation(.default) {
                    vm.sortOption = vm.sortOption == .rank ? .rankReversed : .rank
                }
            }
            
            Spacer()
            if showPortfolio {
                HStack(spacing: 4) {
                    Text("Holdings")
                    Image(systemName: "chevron.down")
                        .opacity((vm.sortOption == .holdings || vm.sortOption == .holdingsReversed) ? 1.0 : 0.0)
                        .rotationEffect(Angle(degrees: vm.sortOption == .holdings ? 0 : 180))
                }
                .onTapGesture {
                    withAnimation(.default) {
                        vm.sortOption = vm.sortOption == .holdings ? .holdingsReversed : .holdings
                    }
                }
            }
            HStack(spacing: 4) {
                Text("Price")
                Image(systemName: "chevron.down")
                    .opacity((vm.sortOption == .price || vm.sortOption == .priceReversed) ? 1.0 : 0.0)
                    .rotationEffect(Angle(degrees: vm.sortOption == .price ? 0 : 180))
                
            }
            .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
            .onTapGesture {
                withAnimation(.default) {
                    vm.sortOption = vm.sortOption == .price ? .priceReversed : .price
                }
            }
            
            Button {
                withAnimation(.linear(duration: 1.0)) {
                    vm.reloadData()
                }
            } label: {
                Image(systemName: "goforward")
            }
            .rotationEffect(Angle(degrees: vm.isLoading ? 360 : 0), anchor: .center)
        }
        .font(.caption)
        .foregroundColor(.theme.ctSecondaryText)
        .padding(.horizontal, .ctDimensions.space3)
    }
}

