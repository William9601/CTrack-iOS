//
//  CTColorProtocol.swift
//
//
//  Created by William von Arend on 03/07/2024.
//

import SwiftUI

extension Color {
    public static let theme = Theme().currentTheme.color
}

public protocol CTColorProtocol {
    var ctAccent: Color { get }
    var ctBackgroundColor: Color { get }
    var ctGreen: Color { get }
    var ctRed: Color { get }
    var ctSecondaryText: Color { get }
}
