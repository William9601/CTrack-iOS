//
//  CTColor.swift
//
//
//  Created by William von Arend on 15/05/2024.
//

import SwiftUI


extension Color {
    public static let theme = CTTheme().currentTheme.color
}

public struct MidnightThemeColor: CTColorProtocol {
    public let ctAccent = Color("AccentColor")
    public let ctBackgroundColor = Color("BackgroundColor")
    public let ctGreen = Color("GreenColor")
    public let ctRed = Color("RedColor")
    public let ctSecondaryText = Color("SecondaryTextColor")
}

public struct SummerThemeColor: CTColorProtocol {
    public let ctAccent = Color("AccentColor")
    public let ctBackgroundColor = Color("BackgroundColor")
    public let ctGreen = Color("GreenColor")
    public let ctRed = Color("RedColor")
    public let ctSecondaryText = Color("SecondaryTextColor")
}
