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
    @Published var isLoading: Bool  = false
    @Published var searchText = ""
    @Published var sortOption: SortOption = .holdings
    
    private let coinDataService = CoinDataService()
    private let marketDataService: MarketDataServiceProtocol
    private let portfolioDataService = PortfolioDataService()
    private var cancellables = Set<AnyCancellable>()
    
    enum SortOption {
        case rank, rankReversed, holdings, holdingsReversed, price, priceReversed
    }
    
    public init(marketDataService: MarketDataServiceProtocol) {
        self.marketDataService = marketDataService
        addSubscribers()
    }
    
    func addSubscribers() {
        // Updates allCoins
        $searchText
            .combineLatest(coinDataService.$allCoins, $sortOption) // This is now subscribed to `searchText` and to `allCoins`. If either change this will get published
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main) // The rest of the function will run after nothing new has been published for 0.5 seconds
            .map(filterAndSortCoins)
            .sink { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
            }
            .store(in: &cancellables)
        
        // Update Portfolio coins
        $allCoins
            .combineLatest(portfolioDataService.$savedEntities)
            .map(mapAllCoinsToPortfolioCoins) // We check the coins in the coinModels and we see if any are included in the portfolioEntities array
            .sink { [weak self] (returnedCoins) in
                guard let self = self else { return }
                self.portfolioCoins = self.sortPortfolioCoinsIfNeeded(coins: returnedCoins)
            }
            .store(in: &cancellables)
        
        // Updates market data
        marketDataService.marketData
            .combineLatest($portfolioCoins) // Any time portfolioCoins gets updated, we will run the functions below
            .map(mapGlobalMarketData)
            .sink { [weak self] (returnedStats) in
                self?.statistics = returnedStats
                self?.isLoading = false
            }
            .store(in: &cancellables)
    }
    
    func updatePortfolio(coin: CoinModel, amount: Double) {
        portfolioDataService.updatePortfolio(coin: coin, amount: amount)
    }
    
    func reloadData() {
        isLoading = true
        coinDataService.getCoins()
        marketDataService.getData()
        HapticManager.notification(type: .success)
    }
    
    private func filterAndSortCoins(text: String, coins: [CoinModel], sort: SortOption) -> [CoinModel] {
        var updatedCoins = filterCoins(text: text, coins: coins)
        sortCoins(sort: sort, coins: &updatedCoins)
        return updatedCoins
    }
    
    func filterCoins(text: String, coins: [CoinModel]) -> [CoinModel] {
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
    
    private func sortCoins(sort: SortOption, coins: inout [CoinModel]) { // use inout and .sort instead of .sorted to sort in place for more efficiency
        switch sort {
        case .rank, .holdings: coins.sort { (coin1, coin2) -> Bool in
            return coin1.rank < coin2.rank
        }
        case .rankReversed, .holdingsReversed: coins.sort(by: { $0.rank > $1.rank })
        case .price: coins.sort(by: { $0.currentPrice > $1.currentPrice})
        case .priceReversed: coins.sort(by: {$0.currentPrice < $1.currentPrice})
        }
    }
    
    private func sortPortfolioCoinsIfNeeded(coins: [CoinModel]) -> [CoinModel] {
        // Will only sort by holdings or reverseHoldings if needed
        switch sortOption {
        case .holdings: coins.sorted(by: { $0.currentHoldingsValue > $1.currentHoldingsValue })
        case .holdingsReversed: coins.sorted(by: {$0.currentHoldingsValue < $1.currentHoldingsValue})
        default: coins
        }
    }
    
    private func mapAllCoinsToPortfolioCoins(allCoins: [CoinModel], portfolioEntities: [PortfolioEntityMO]) -> [CoinModel] {
        allCoins
            .compactMap { (coin) -> CoinModel? in // We use Compact map because the result of compact map is optional. For coins that are not in the con model we will return nil and remove them from the final array
                guard let entity = portfolioEntities.first(where: { $0.coinID == coin.id }) else {
                    return nil
                }
                
                return coin.updateHoldings(amount: entity.amount)
            }
    }
    
    private func mapGlobalMarketData(marketDataModel: MarketDataModel?, portfolioCoins: [CoinModel]) -> [StatisticsModel] {
        var stats: [StatisticsModel] = []
        
        guard let data = marketDataModel else {
            return stats
        }
        
        let marketCap = StatisticsModel(title: "Market Cap", value: data.marketCap, percentageChange: data.marketCapChangePercentage24HUsd)
        let volume = StatisticsModel(title: "24 hour Volume", value: data.volume)
        let btcDominance = StatisticsModel(title: "BTC Dominance", value: data.btcDominance)
        
        let portfolioValue = portfolioCoins.map { (coin) -> Double in
            coin.currentHoldingsValue
        }.reduce(0, +)
        
        let previousValue = portfolioCoins.map { coin -> Double in
            let currentValue  = coin.currentHoldingsValue
            let percentageChange = coin.priceChangePercentage24H ?? 0 / 100
            let previousValue = currentValue / (1 + percentageChange)
            
            return previousValue
        }.reduce(0, +)
        
        let percentageChange = ((portfolioValue - previousValue)  /  previousValue) * 100
        
        let portfolio = StatisticsModel(title: "Portfolio Value", value: portfolioValue.asCurrencyWith2Decimals(), percentageChange: percentageChange)
        
        stats.append(contentsOf: [
            marketCap,
            volume,
            btcDominance,
            portfolio
        ])
        return stats
    }
}
