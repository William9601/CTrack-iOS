//
//  Theme.swift
//
//
//  Created by William von Arend on 03/05/2024.
//

import SwiftUI

public class ThemeManager {
    public static let shared = ThemeManager() // Singleton, could be a problem if other places in the app are setting a theme. Could lead to race conditions
    
    private init() {}
    
    private var theme: CTThemes = .summer
    
    public func getTheme() -> CTThemes {
        return theme
    }
    
    public func setTheme(_ newTheme: CTThemes) {
        theme = newTheme
    }
}

public enum CTThemes {
    case midnight
    case summer
    case autumn
    
    var selectedTheme: CTThemeProtocol {
        switch self {
        case .midnight: MidnightTheme()
        case .summer: SummerTheme()
        case .autumn: AutumnTheme()
        }
    }
}

public struct MidnightTheme: CTThemeProtocol {
    public let color: CTColorProtocol = MidnightThemeColor()
    public let dimensions: CTDimensionsProtocol = CTDimensions()
}

public struct SummerTheme: CTThemeProtocol {
    public let color: CTColorProtocol = SummerThemeColor()
    public let dimensions: CTDimensionsProtocol = CTDimensions()
}

public struct AutumnTheme: CTThemeProtocol {
    public let color: CTColorProtocol = AutumnThemeColor()
    public let dimensions: CTDimensionsProtocol = CTDimensions()
}
