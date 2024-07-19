//
//  CTrack_iOSApp.swift
//  CTrack-iOS
//
//  Created by William von Arend on 10/03/2024.
//

import SwiftUI
import Root
import Services

@main
struct CTrack_iOSApp: App {
    let marketDataService = MarketDataService()
    
    var body: some Scene {
        WindowGroup {
            RootView(marketDataService: marketDataService)
        }
    }
}
