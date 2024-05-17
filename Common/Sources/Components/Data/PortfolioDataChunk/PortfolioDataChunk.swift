//
//  PortfolioDataChunk.swift
//
//
//  Created by William von Arend on 16/05/2024.
//

import SwiftUI
import Common
import ThemeManager

public struct PortfolioDataChunk: View {
    let alignmnet: PortfolioDataChunkAlignment
    let title: String
    let subtext: String?
    let icon: Image?
    
    public init(alignmnet: PortfolioDataChunkAlignment,
                title: String,
                subtext: String?,
                icon: Image?) {
        self.alignmnet = alignmnet
        self.title = title
        self.subtext = subtext
        self.icon = icon
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
        VStack(alignment: .leading, spacing: .zero) {
            Text(title)
            if let subtext {
                Text(subtext)
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
                .frame(height: .iconS)
                .padding(.trailing, .space1)
        }
    }
}

struct PortfolioDataChunk_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioDataChunk(alignmnet: .leading, 
                           title: "Label",
                           subtext: "Subtext",
                           icon: Image(systemName: "checkmark.circle"))
    }
}
