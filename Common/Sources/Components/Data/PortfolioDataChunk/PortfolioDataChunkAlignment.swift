//
//  PortfolioDataChunkAlignment.swift
//
//
//  Created by William von Arend on 16/05/2024.
//

import SwiftUI

public enum PortfolioDataChunkAlignment {
    case leading
    case trailing
    
    public var alignment: HorizontalAlignment {
        switch self {
        case .leading: .leading
        case .trailing: .trailing
        }
    }
}
