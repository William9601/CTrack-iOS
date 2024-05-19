//
//  CoinRowView.swift
//
//
//  Created by William von Arend on 19/05/2024.
//

import SwiftUI
import Models
import Extensions

struct CoinRowView: View {
    let coin: CoinModel
    
    var body: some View {
        Text("Hi")
    }
}

struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            CoinRowView(coin: dev.coin)
        }
    }
}
