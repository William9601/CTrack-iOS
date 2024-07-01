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
    
    var coinSubscription: AnyCancellable?
    
    public init() {
        getCoins() // 1- Initialise and call getCoins()
    }
    
    private func getCoins() {
        guard let url = URL(string: // 2- Fetch the URL
                                "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h"
        )
        else { return }
        
        coinSubscription = URLSession.shared.dataTaskPublisher(for: url) // 3- Get the data from the URL
            .subscribe(on:DispatchQueue.global(qos: .default))
            .tryMap { (output) -> Data in
                guard let response = output.response as? HTTPURLResponse, // 4- Check it receives a valid response
                      response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
                return output.data
            }
            .receive(on: DispatchQueue.main)
            .decode(type: [CoinModel].self, decoder: JSONDecoder()) // 5- It will decode the data into CoinModels
            .sink { (completion) in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription) // 6- If there's an error it will print it out
                }
            } receiveValue: { [weak self] (returnedCoins) in
                self?.allCoins = returnedCoins //7- If no error, it will append returnedCoins into allCoins
                self?.coinSubscription?.cancel()
            }
    }
}

