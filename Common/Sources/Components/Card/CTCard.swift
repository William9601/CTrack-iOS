//
//  File.swift
//  
//
//  Created by William von Arend on 30/04/2024.
//

import SwiftUI
import ThemeManager

public struct CTCard<Content: View>: View {
    var content: Content
    
    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    public var body: some View {
        VStack {
            content
                .padding(.ctSpace3)
        }.roundedBackground(backgroundColor: .theme.ctBackgroundColor,
                            borderColor: .theme.ctAccent,
                            cornerRadius: .ctCornerRadiusDefault)
    }
}

struct CTCard_Previews: PreviewProvider {
    static var previews: some View {
        CTCard {
            Text("Card Component")
        }
    }
}

