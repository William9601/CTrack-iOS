//
//  File.swift
//  
//
//  Created by William von Arend on 15/05/2024.
//

import SwiftUI

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
