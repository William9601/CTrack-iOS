//
//  DetailViewModel.swift
//
//
//  Created by William von Arend on 05/08/2024.
//

import Foundation
import Services
import Models
import Combine

class DetailViewModel: ObservableObject {
    private let coinDetailService: CoinDetailDataService
    
    init(coin: CoinModel) {
        self.coinDetailService = CoinDetailDataService(coin: coin)
    }
    
    private func addSubscribers() {
        coinDetailService.$coinDetails
//            .combineLatest($coin)
//            .map(mapDataToStatistics)
            .sink { [weak self] (returnedArrays) in
                print(returnedArrays)
            }
//            .store(in: &cancellables)
        
//        coinDetailService.$coinDetails
//            .sink { [weak self] (returnedCoinDetails) in
//                self?.coinDescription = returnedCoinDetails?.readableDescription
//                self?.websiteURL = returnedCoinDetails?.links?.homepage?.first
//                self?.redditURL = returnedCoinDetails?.links?.subredditURL
//            }
//            .store(in: &cancellables)
    }
    
}
