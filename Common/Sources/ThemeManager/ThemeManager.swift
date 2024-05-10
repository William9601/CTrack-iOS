//
//  File.swift
//  
//
//  Created by William von Arend on 03/05/2024.
//

enum Themes {
    case midnight
    case summer
}

public struct MidnightTheme: ThemeManagerProtocol {
    var colour: CTColourProtocol = MidnightThemeColour
    var dimensions: CTDimensionsProtocol = CTDimensions
    
//    public init() {}
}

public struct MidnightThemeColour: CTColourProtocol {
    var ctPrimary: Color { Color("ctPrimary") }
    var ctSecondary: Color { Color("ctSecondary") }
    var ctAlert: Color { Color("ctAlert") }
}

public struct SummerThemeColour: CTColourProtocol {
    var ctPrimary: Color { Color("ctPrimary") }
    var ctSecondary: Color { Color("ctSecondary") }
    var ctAlert: Color { Color("ctAlert") }
}

public class ThemeManager {
    static let shared = ThemeManager()
    private init() {}
    
    var currentTheme: ThemeManagerProtocol = MidnightTheme()
    
    func setTheme(_ theme: Themes) {
        switch theme {
        case .midnight:
            currentTheme = MidnightTheme()
        case .summer:
            currentTheme = SummerTheme()
        }
    }
}
