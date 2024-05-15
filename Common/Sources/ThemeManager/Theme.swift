//
//  File.swift
//  
//
//  Created by William von Arend on 03/05/2024.
//

import SwiftUI

public struct Theme {
    public var currentTheme = MidnightTheme()
}

public struct MidnightTheme: ThemeProtocol {
    public let color: CTColorProtocol = MidnightThemeColor()
    public let dimensions: CTDimensionsProtocol = CTDimensions()
}

public struct SummerTheme: ThemeProtocol {
    public let color: CTColorProtocol = SummerThemeColor()
    public let dimensions: CTDimensionsProtocol = CTDimensions()
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

public protocol ThemeProtocol {
    var color: CTColorProtocol { get }
    var dimensions: CTDimensionsProtocol { get }
}
