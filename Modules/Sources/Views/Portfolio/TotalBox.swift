//
//  TotalBox.swift
//
//
//  Created by William von Arend on 16/05/2024.
//

import SwiftUI
import Components

public struct TotalBox: View {
    public var body: some View {
        CTCard {
            HStack {
                VStack {
                    Text("Total")
                    Text("£3,500")
                }
                Spacer()
                VStack {
                    Text("Profit")
                    Text("£150")
                }
            }
        }
    }
}

struct TotalBox_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            TotalBox()
        }.frame(width: 200)
    }
}
