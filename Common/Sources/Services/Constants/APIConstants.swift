//
//  APIConstants.swift
//
//
//  Created by William von Arend on 03/07/2024.
//

struct APIConstants {
    static let getCoinsURL = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h"
    
    static let getMarketDataURL = "https://api.coingecko.com/api/v3/global"
}
