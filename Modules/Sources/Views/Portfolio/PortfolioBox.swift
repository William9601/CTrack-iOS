//
//  PortfolioBox.swift
//  
//
//  Created by William von Arend on 16/05/2024.
//

import SwiftUI
import Components

public struct PortfolioBox: View {
    public init() {}
    
    public var body: some View {
        CTCard {
            VStack {
                HStack {
                    PortfolioDataChunk(alignmnet: .leading, title: "Title", subtext: "Subtext", icon: Image(systemName: "checkmark.circle"))
                    Spacer()
                    VStack(alignment: .leading) {
                        Text("£2500")
                        Text("£150 3.5%")
                    }
                }
                Spacer()
                Button("Add") {
                    print("Here")
                }
            }
        }
    }
}

struct PortfolioBox_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioBox()
    }
}
