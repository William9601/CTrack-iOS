//
//  DetailView.swift
//
//
//  Created by William von Arend on 23/07/2024.
//

import SwiftUI
import Models

struct DetailLoadingView: View {
    @Binding var coin: CoinModel?
    
    var body: some View {
        ZStack {
            if let coin = coin {
                DetailView(coin: coin)
            }
        }
    }
}

struct DetailView: View {
    @StateObject var vm: DetailViewModel //We need to pass in a coin but we don't have this coin yet. That's why we need to initialise this view model from within our init
    
    init(coin: CoinModel) {
        _vm = StateObject(wrappedValue: DetailViewModel(coin: coin))
        print(coin.name)
    }
    
    var body: some View {
        Text("Hello")
    }
}
