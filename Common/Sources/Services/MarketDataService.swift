//
//  MarketDataService.swift
//
//
//  Created by William von Arend on 08/07/2024.
//

import Combine
import Foundation
import Models

public class MarketDataService {
    
    @Published public var marketData: MarketDataModel? = nil
    
    private var marketDataSubscription: AnyCancellable?
    
    public init() {
        getData()
    }
    
    private func getData() {
        guard let url = URL(string: APIConstants.getMarketDataURL)
        else { return }
        
        marketDataSubscription = NetworkingManager.download(url: url)
            .decode(type: GlobalData.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] (returnedGlobalData) in
                self?.marketData = returnedGlobalData.data
                self?.marketDataSubscription?.cancel()
            })
    }
}

