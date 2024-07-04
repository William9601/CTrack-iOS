//
//  Theme.swift
//
//
//  Created by William von Arend on 03/05/2024.
//

import SwiftUI

public struct CTTheme {
    public var currentTheme = MidnightTheme()
}

public struct MidnightTheme: CTThemeProtocol {
    public let color: CTColorProtocol = MidnightThemeColor()
    public let dimensions: CTDimensionsProtocol = CTDimensions()
}

public struct SummerTheme: CTThemeProtocol {
    public let color: CTColorProtocol = SummerThemeColor()
    public let dimensions: CTDimensionsProtocol = CTDimensions()
}
