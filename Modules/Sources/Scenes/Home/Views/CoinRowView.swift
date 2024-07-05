//
//  CoinRowView.swift
//
//
//  Created by William von Arend on 19/05/2024.
//

import SwiftUI
import Models
import Components

struct CoinRowView: View {
    let coin: CoinModel
    let showHoldingsColumn: Bool
    
    var body: some View {
        HStack {
            leftColumn
            Spacer()
            if showHoldingsColumn {
                centerColumn
            }
            rightColumn
        }
    }
}

extension CoinRowView {
    private var leftColumn: some View {
        HStack(spacing: .zero) {
            Text("\(coin.rank)")
                .font(.caption)
                .foregroundColor(.theme.ctAccent)
                .frame(minWidth: 30)
            CTDataChunk(alignment: .leading,
                        title: coin.symbol.uppercased(),
                        leadingIcon: {
                CoinImageView(coin: coin)
                    .frame(width: 30, height: 30)
            })
            .padding(.leading, .ctDimensions.space3)
        }
    }
    
    private var centerColumn: some View {
        VStack {
            CTDataChunk(alignment: .trailing, title: coin.currentHoldingsValue.asCurrencyWith2Decimals(), subtext: (coin.currentHoldings ?? 0).asNumberString())
        }
    }
    
    private var rightColumn: some View {
        VStack {
            CTDataChunk(alignment: .trailing,
                        title: coin.currentPrice.asCurrencyWith6Decimals(),
                        subtext: coin.priceChangePercentage24H?.asPercentString() ?? "",
                        subtextColor: (coin.priceChangePercentage24H ?? 0) >= 0
                        ? .theme.ctGreen
                        : .theme.ctRed)
        }.frame(width: UIScreen.main.bounds.width / 3.5, alignment: .topTrailing) // Use Geometry reader if you allow the app in landscape mode
    }
}


struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        CoinRowView(coin: dev.coin, showHoldingsColumn: true)
    }
}
