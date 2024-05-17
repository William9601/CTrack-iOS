//
//  Dashboard.swift
//
//
//  Created by William von Arend on 09/05/2024.
//

import SwiftUI
import Components

public struct Dashboard: View {
    public init() {}
    public var body: some View {
        VStack {
            HStack {
                TotalBox()
            }.frame(width: 200)
            
        }
        
    }
}

struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard()
    }
}
