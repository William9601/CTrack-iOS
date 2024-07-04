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
    private let cornerRadius: CGFloat
    private let stroke: StrokeStyle
    
    init(backgroundColor: Color,
         borderColor: Color,
         cornerRadius: CGFloat,
         stroke: StrokeStyle) {
        self.backgroundColor = backgroundColor
        self.borderColor = borderColor
        self.cornerRadius = cornerRadius
        self.stroke = stroke
    }
    
    func body(content: Content) -> some View {
        content.background(
            ZStack {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .fill(backgroundColor)
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(borderColor, style: stroke)
            }
        )
    }
}

extension View {
    public func roundedBackground(backgroundColor: Color = .clear,
                                  borderColor: Color,
                                  cornerRadius: CGFloat) -> some View {
        modifier(RoundedBackground(backgroundColor: backgroundColor,
                                   borderColor: borderColor,
                                   cornerRadius: cornerRadius,
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
                           cornerRadius: 4)
    }
}
