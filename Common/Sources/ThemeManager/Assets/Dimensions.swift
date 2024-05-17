//
//  File.swift
//  
//
//  Created by William von Arend on 15/05/2024.
//

import SwiftUI

extension CGFloat {
    public static let space0: CGFloat = CTDimensions().space0
    public static let space1: CGFloat = CTDimensions().space1
    public static let space2: CGFloat = CTDimensions().space2
    public static let space3: CGFloat = CTDimensions().space3
    public static let space4: CGFloat = CTDimensions().space3
    public static let borderRadius: CGFloat = CTDimensions().borderRadius
    public static let borderWidth: CGFloat = CTDimensions().borderWidth
    public static let iconXS: CGFloat = CTDimensions().iconXS // Should make an icon container component
    public static let iconS: CGFloat = CTDimensions().iconS
    public static let iconM: CGFloat = CTDimensions().iconM
    public static let iconL: CGFloat = CTDimensions().iconL
    public static let iconXL: CGFloat = CTDimensions().iconXL
}

public protocol CTDimensionsProtocol {
    var space0: CGFloat { get }
    var space1: CGFloat { get }
    var space2: CGFloat { get }
    var space3: CGFloat { get }
    var space4: CGFloat { get }
    var borderRadius: CGFloat { get }
    var borderWidth: CGFloat { get }
    var iconXS: CGFloat { get }
    var iconS: CGFloat { get }
    var iconM: CGFloat { get }
    var iconL: CGFloat { get }
    var iconXL: CGFloat { get }
}

struct CTDimensions: CTDimensionsProtocol {
    var space0: CGFloat { 0 }
    var space1: CGFloat { 2 }
    var space2: CGFloat { 4 }
    var space3: CGFloat { 6 }
    var space4: CGFloat { 8 }
    var borderRadius: CGFloat { 4 }
    var borderWidth: CGFloat { 1 }
    var iconXS: CGFloat { 4 }
    var iconS: CGFloat { 6 }
    var iconM: CGFloat { 8 }
    var iconL: CGFloat { 12 }
    var iconXL: CGFloat { 16 }
}
