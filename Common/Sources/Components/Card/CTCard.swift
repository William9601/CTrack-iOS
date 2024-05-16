//
//  File.swift
//  
//
//  Created by William von Arend on 30/04/2024.
//

import SwiftUI
import ThemeManager
import Common

public struct CTCard<Content: View>: View {
    var content: Content
    
    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    public var body: some View {
        VStack {
            content
                .padding(.space3)
        }.roundedBackground(backgroundColor: .theme.ctBackgroundColor,
                            borderColor: .theme.ctAccent,
                            borderRadius: 4)
    }
}

struct CTCard_Previews: PreviewProvider {
    static var previews: some View {
        CTCard {
            Text("Card Component")
        }
    }
}

