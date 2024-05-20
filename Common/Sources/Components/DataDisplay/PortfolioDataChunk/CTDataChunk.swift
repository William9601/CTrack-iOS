//
//  PortfolioDataChunk.swift
//
//
//  Created by William von Arend on 16/05/2024.
//

import SwiftUI
import Common
import ThemeManager

public struct CTDataChunk: View {
    let alignment: CTDataChunkAlignment
    let title: String
    let subtext: String?
    let icon: Image?
    let titleColor: Color?
    let subtextColor: Color?
    
    public init(alignment: CTDataChunkAlignment,
                title: String,
                subtext: String? = nil,
                icon: Image? = nil,
                titleColor: Color? = nil,
                subtextColor: Color? = nil) {
        self.alignment = alignment
        self.title = title
        self.subtext = subtext
        self.icon = icon
        self.titleColor = titleColor
        self.subtextColor = subtextColor
    }
    
    public var body: some View {
        HStack {
            leadingIcon
                .alignmentGuide(
                    VerticalAlignment.center,
                    computeValue: TextIconAlignment.iconAlignmentGuide(view:)
                )
            label.alignmentGuide(
                VerticalAlignment.center,
                computeValue: TextIconAlignment.textAlignmentGuide
            )
        }
    }
    
    private var label: some View {
        VStack(alignment: alignment.labelAlignment, spacing: .zero) {
            Text(title)
                .font(.headline)
                .foregroundColor(titleColor ?? .theme.ctAccent)
            if let subtext {
                Text(subtext)
                    .font(.subheadline)
                    .foregroundColor(subtextColor ?? .theme.ctSecondaryText)
            }
        }
        
    }
    
    @ViewBuilder private var leadingIcon: some View {
        if let icon {
            icon
                .resizable()
                .renderingMode(.template)
                .scaledToFill()
                .fixedSize()
                .foregroundColor(.black)
                .frame(height: .ctIconS)
                .padding(.trailing, .ctSpace1)
        }
    }
}

struct CTDataChunk_Previews: PreviewProvider {
    static var previews: some View {
        CTDataChunk(alignment: .leading,
                    title: "Label",
                    subtext: "Subtext",
                    icon: Image(systemName: "checkmark.circle"))
    }
}
