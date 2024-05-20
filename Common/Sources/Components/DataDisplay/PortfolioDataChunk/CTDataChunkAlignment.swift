//
//  PortfolioDataChunkAlignment.swift
//
//
//  Created by William von Arend on 16/05/2024.
//

import SwiftUI

public enum CTDataChunkAlignment {
    case leading
    case trailing
    
    public var labelAlignment: HorizontalAlignment {
        switch self {
        case .leading: .leading
        case .trailing: .trailing
        }
    }
}
