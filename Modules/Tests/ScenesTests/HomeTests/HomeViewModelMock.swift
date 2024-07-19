//
//  HomeViewModelMock.swift
//
//
//  Created by William von Arend on 16/07/2024.
//

import Foundation
import Models
import Services
import Combine

struct HomeViewModelMock {
    static let mockCoins: [CoinModel] = [
        CoinModel(id: "bitcoin", symbol: "btc", name: "Bitcoin", image: "", currentPrice: 30000, marketCap: 600000000000, marketCapRank: 1, fullyDilutedValuation: nil, totalVolume: 30000000000, high24H: 31000, low24H: 29000, priceChange24H: 500, priceChangePercentage24H: 1.5, marketCapChange24H: 9000000000, marketCapChangePercentage24H: 1.5, circulatingSupply: 18000000, totalSupply: 21000000, maxSupply: 21000000, ath: 60000, athChangePercentage: -50, athDate: nil, atl: 100, atlChangePercentage: 29900, atlDate: nil, lastUpdated: nil, sparklineIn7D: nil, priceChangePercentage24HInCurrency: nil, currentHoldings: nil),
        CoinModel(id: "ethereum", symbol: "eth", name: "Ethereum", image: "", currentPrice: 2000, marketCap: 200000000000, marketCapRank: 2, fullyDilutedValuation: nil, totalVolume: 20000000000, high24H: 2100, low24H: 1900, priceChange24H: 50, priceChangePercentage24H: 2.5, marketCapChange24H: 5000000000, marketCapChangePercentage24H: 2.5, circulatingSupply: 114000000, totalSupply: nil, maxSupply: nil, ath: 4000, athChangePercentage: -50, athDate: nil, atl: 0.5, atlChangePercentage: 399900, atlDate: nil, lastUpdated: nil, sparklineIn7D: nil, priceChangePercentage24HInCurrency: nil, currentHoldings: nil),
        CoinModel(id: "cardano", symbol: "ada", name: "Cardano", image: "", currentPrice: 1, marketCap: 32000000000, marketCapRank: 5, fullyDilutedValuation: nil, totalVolume: 5000000000, high24H: 1.1, low24H: 0.9, priceChange24H: 0.02, priceChangePercentage24H: 2, marketCapChange24H: 640000000, marketCapChangePercentage24H: 2, circulatingSupply: 32000000000, totalSupply: 45000000000, maxSupply: 45000000000, ath: 2, athChangePercentage: -50, athDate: nil, atl: 0.02, atlChangePercentage: 4900, atlDate: nil, lastUpdated: nil, sparklineIn7D: nil, priceChangePercentage24HInCurrency: nil, currentHoldings: nil)
    ]
  
    static var stats: MarketDataModel? = MarketDataModel(totalMarketCap: ["btc": 43945962.151456155], totalVolume: ["btc": 5838405.376372819], marketCapPercentage: ["btc": 42.56418169927073,], marketCapChangePercentage24HUsd: 0.5446264306552537)
}

class MarketDataServiceMock: MarketDataServiceProtocol {
    let marketData = CurrentValueSubject<Models.MarketDataModel?, Never>(nil)
}
