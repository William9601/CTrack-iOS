//
//  CTColor.swift
//
//
//  Created by William von Arend on 15/05/2024.
//

import SwiftUI


extension Color {
    public static let theme = ThemeManager.shared.getTheme().selectedTheme.color
}

public struct MidnightThemeColor: CTColorProtocol {
    public let ctAccent = Color.blue
    public let ctBackgroundColor = Color.yellow
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

//public struct AutumnThemeColor: CTColorProtocol {
//    public let ctAccent = Color(red: 211/255, green: 84/255, blue: 0/255)
//    public let ctBackgroundColor = Color(red: 243/255, green: 156/255, blue: 18/255)
//    public let ctGreen = Color(red: 39/255, green: 174/255, blue: 96/255)
//    public let ctRed = Color(red: 192/255, green: 57/255, blue: 43/255)
//    public let ctSecondaryText = Color(red: 127/255, green: 140/255, blue: 141/255)
//}

public struct AutumnThemeColor: CTColorProtocol {
    public let ctAccent = Color(red: 205/255, green: 92/255, blue: 92/255) // Indian Red
    public let ctBackgroundColor = Color(red: 250/255, green: 235/255, blue: 215/255) // Antique White
    public let ctGreen = Color(red: 107/255, green: 142/255, blue: 35/255) // Olive Drab
    public let ctRed = Color(red: 178/255, green: 34/255, blue: 34/255) // Fire Brick
    public let ctSecondaryText = Color(red: 112/255, green: 128/255, blue: 144/255) // Slate Gray
}
