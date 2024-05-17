//
//  TextIconAlignment.swift
//
//
//  Created by William von Arend on 16/05/2024.
//

import SwiftUI

public enum TextIconAlignment {
    public static func iconAlignmentGuide(view: ViewDimensions) -> CGFloat {
        view.height / 2
    }

    public static func textAlignmentGuide(view: ViewDimensions) -> CGFloat {
        let baselineDifference = view[.lastTextBaseline] - view[.firstTextBaseline]
        return (view.height - baselineDifference) / 2
    }
}
