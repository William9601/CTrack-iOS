//
//  CTCard.swift
//  
//
//  Created by William von Arend on 30/04/2024.
//

import SwiftUI
import ThemeManager

public struct CTCard<Content: View>: View {
    var content: Content
    private let size: CTCardSize
    
    public init(
        size: CTCardSize = .regular,
        @ViewBuilder content: () -> Content) {
            self.size = size
            self.content = content()
        }
    
    public var body: some View {
        VStack {
            content
                .padding(size.padding)
        }.roundedBackground(backgroundColor: .theme.ctBackgroundColor,
                            borderColor: .theme.ctAccent,
                            cornerRadius: .ctDimensions.cornerRadiusDefault)
    }
}

struct CTCard_Previews: PreviewProvider {
    static var previews: some View {
        CTCard {
            Text("Card Component")
        }
    }
}

