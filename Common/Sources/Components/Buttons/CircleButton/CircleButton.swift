//
//  CircleButton.swift
//  
//
//  Created by William von Arend on 18/05/2024.
//

import SwiftUI

public struct CircleButton: View {
    
    public init(iconName: String) {
        self.iconName = iconName
    }
    
    let iconName: String
    
    public var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundColor(Color.theme.ctAccent)
            .frame(width: 50, height: 50)
            .background(
                Circle()
                    .foregroundColor(Color.theme.ctBackgroundColor)
            )
            .shadow(
                color: Color.theme.ctAccent.opacity(0.25),
                radius: 10, x: 0, y: 0)
            .padding()
    }
}

struct CircleButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CircleButton(iconName: "info")
                .previewLayout(.sizeThatFits)

            CircleButton(iconName: "plus")
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}
