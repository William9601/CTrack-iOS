//
//  CTDimensionsProtocol.swift
//
//
//  Created by William von Arend on 03/07/2024.
//

import SwiftUI

public protocol CTDimensionsProtocol {
    var space0: CGFloat { get }
    var space1: CGFloat { get }
    var space2: CGFloat { get }
    var space3: CGFloat { get }
    var space4: CGFloat { get }
    var cornerRadiusDefault: CGFloat { get }
    var cornerRadiusRound: CGFloat { get }
    var borderWidth: CGFloat { get }
    var iconXS: CGFloat { get }
    var iconS: CGFloat { get }
    var iconM: CGFloat { get }
    var iconL: CGFloat { get }
    var iconXL: CGFloat { get }
}
