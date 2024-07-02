//
//  CoinDataService.swift
//
//
//  Created by William von Arend on 30/05/2024.
//

import Combine
import Foundation
import Models

public class CoinDataService {
    
    @Published public var allCoins: [CoinModel] = [] // Publishers can have subscribers so everytime this gets updated with data, the subscribers will get that data
    
    private var coinSubscription: AnyCancellable?
    
    public init() {
        getCoins() // 1- Initialise and call getCoins()
    }
    
    private func getCoins() {
        guard let url = URL(string: // 2- Fetch the URL
                            "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h"
        )
        else { return }
        
        coinSubscription = NetworkingManager.download(url: url)
            .decode(type: [CoinModel].self, decoder: JSONDecoder()) // 5- It will decode the data into CoinModels
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins
                self?.coinSubscription?.cancel()
            })
    }
}

