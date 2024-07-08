//
//  HomeViewModel.swift
//
//
//  Created by William von Arend on 30/05/2024.
//

import Combine
import Foundation
import Models
import Services

public class HomeViewModel: ObservableObject {
    
    @Published var statistics: [StatisticsModel] = []
    
    @Published var allCoins: [CoinModel] = []
    @Published var portfolioCoins: [CoinModel] = []
    
    @Published var searchText = ""
    
    private let coinDataService = CoinDataService()
    private let marketDataService = MarketDataService()
    private var cancellables = Set<AnyCancellable>()
    
    public init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        // Updates allCoins
        $searchText
            .combineLatest(coinDataService.$allCoins) // This is now subscribed to `searchText` and to `allCoins`. If either change this will get published
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main) // The rest of the function will run after nothing new has been published for 0.5 seconds
            .map(filterCoins)
            .sink { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
        
        // Updates market data
        marketDataService.$marketData
            .map(mapGlobalMarketData)
            .sink { [weak self] (returnedStats) in
                self?.statistics = returnedStats
            }
            .store(in: &cancellables)
    }
    
    private func filterCoins(text: String, coins: [CoinModel]) -> [CoinModel] {
        guard !text.isEmpty else {
            return coins
        }
        
        let lowercasedText = text.lowercased()
        
        return coins.filter { (coin) -> Bool in
            return coin.name.lowercased().contains(lowercasedText) ||
            coin.symbol.lowercased().contains(lowercasedText) ||
            coin.id.lowercased().contains(lowercasedText)
        }
    }
    
    private func mapGlobalMarketData(marketDataModel: MarketDataModel?) -> [StatisticsModel] {
        var stats: [StatisticsModel] = []
        
        guard let data = marketDataModel else {
            return stats
        }
        
        let marketCap = StatisticsModel(title: "Market Cap", value: data.marketCap, percentageChange: data.marketCapChangePercentage24HUsd)
        
        let volume = StatisticsModel(title: "24 hour Volume", value: data.volume)
        let btcDominance = StatisticsModel(title: "BTC Dominance", value: data.btcDominance)
        let portfolio = StatisticsModel(title: "Portfolio Value", value: "$0.00", percentageChange: 0)
        
        stats.append(contentsOf: [
            marketCap,
            volume,
            btcDominance,
            portfolio
        ])
        return stats
    }
}
