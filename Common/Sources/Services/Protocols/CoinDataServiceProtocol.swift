//
//  File.swift
//  
//
//  Created by William von Arend on 16/07/2024.
//

import Foundation
import Models
//import Combine

public protocol CoinDataServiceProtocol {
    var allCoins: [CoinModel] { get set }
    func getCoins() 
}
