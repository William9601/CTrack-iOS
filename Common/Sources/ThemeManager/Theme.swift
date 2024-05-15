//
//  File.swift
//  
//
//  Created by William von Arend on 03/05/2024.
//

import SwiftUI

//enum CTThemes {
//    case midnight
//    case summer
//
//    var ctTheme: ThemeProtocol {
//        switch self {
//        case .midnight: MidnightTheme
//        case .summer: SummerTheme
//        }
//    }
//}

//enum CTThemes {
//    case MidnightTheme
//    case SummerTheme
//
//    var midnightTheme: MidnightTheme { MidnightTheme }
//}

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

public struct Theme {
//    let theme: ThemeProtocol
//    public init() {}
    
    public var currentTheme = MidnightTheme()
}

public protocol CTColorProtocol {
    var ctAccent: Color { get }
    var ctBackgroundColor: Color { get }
    var ctGreen: Color { get }
    var ctRed: Color { get }
    var ctSecondaryText: Color { get }
}

public protocol CTDimensionsProtocol {
    var borderRadius: Float { get }
    var space0: Float { get }
    var space1: Float { get }
    var space2: Float { get }
    var space3: Float { get }
}

public struct CTDimensions: CTDimensionsProtocol {
    public init() {}

    public var borderRadius: Float { 4 }
    public var space0: Float { 0 }
    public var space1: Float { 2 }
    public var space2: Float { 4 }
    public var space3: Float { 6 }
}

extension Color {
    public static let theme = Theme().currentTheme.color
}


//public class ThemeManager {
//    static let shared = ThemeManager()
//    private init() {}
//
//    var currentTheme: ThemeManagerProtocol = MidnightTheme()
//
//    func setTheme(_ theme: Themes) {
//        switch theme {
//        case .midnight:
//            currentTheme = MidnightTheme()
//        case .summer:
//            currentTheme = SummerTheme()
//        }
//    }
//}

