//
//  CTDimensions.swift
//  
//
//  Created by William von Arend on 15/05/2024.
//

import SwiftUI

extension CGFloat {
    public static var ctDimensions: CTDimensionsProtocol { CTDimensions() }
}

extension Double {
    public static var ctDimensions: CTDimensionsProtocol { CTDimensions() }
}

struct CTDimensions: CTDimensionsProtocol {
    var space0: CGFloat { 0 }
    var space05: CGFloat { 1 }
    var space1: CGFloat { 2 }
    var space2: CGFloat { 4 }
    var space3: CGFloat { 6 }
    var space4: CGFloat { 8 }
    var space5: CGFloat { 12 }
    var space6: CGFloat { 16 }
    var space7: CGFloat { 20 }
    var cornerRadiusDefault: CGFloat { 4 }
    var cornerRadiusRound: CGFloat { 24 }
    var borderWidth: CGFloat { 1 }
    var iconXS: CGFloat { 4 }
    var iconS: CGFloat { 6 }
    var iconM: CGFloat { 8 }
    var iconL: CGFloat { 12 }
    var iconXL: CGFloat { 16 }
}
