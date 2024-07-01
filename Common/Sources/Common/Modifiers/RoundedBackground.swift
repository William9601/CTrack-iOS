//
//  RoundedBackground.swift
//
//
//  Created by William von Arend on 16/05/2024.
//

import SwiftUI

private struct RoundedBackground: ViewModifier {
    private let backgroundColor: Color
    private let borderColor: Color
    private let borderRadius: CGFloat
    private let stroke: StrokeStyle
    
    init(backgroundColor: Color,
         borderColor: Color,
         borderRadius: CGFloat,
         stroke: StrokeStyle) {
        self.backgroundColor = backgroundColor
        self.borderColor = borderColor
        self.borderRadius = borderRadius
        self.stroke = stroke
    }
    
    func body(content: Content) -> some View {
        content.background(
            ZStack {
                RoundedRectangle(cornerRadius: borderRadius)
                    .fill(backgroundColor)
                RoundedRectangle(cornerRadius: borderRadius)
                    .stroke(borderColor, style: stroke)
            }
        )
    }
}

extension View {
    public func roundedBackground(backgroundColor: Color = .clear,
                                  borderColor: Color,
                                  borderRadius: CGFloat) -> some View {
        modifier(RoundedBackground(backgroundColor: backgroundColor,
                                   borderColor: borderColor,
                                   borderRadius: borderRadius,
                                   stroke: StrokeStyle(lineWidth: 1)))
    }
}

struct RoundedBackground_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Text("Rounded Background")
        }
        .padding()
        .roundedBackground(backgroundColor: Color.cyan,
                           borderColor: Color.blue,
                           borderRadius: 4)
    }
}
