//
//  File.swift
//  
//
//  Created by William von Arend on 30/04/2024.
//

import SwiftUI

public protocol ThemeProtocol {
        var color: CTColorProtocol { get }
        var dimensions: CTDimensionsProtocol { get }
}
