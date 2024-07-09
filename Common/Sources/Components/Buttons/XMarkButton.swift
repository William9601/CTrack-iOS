//
//  XMarkButton.swift
//
//
//  Created by William von Arend on 08/07/2024.
//

import SwiftUI

public struct XMarkButton: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    public init() {}

    public var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }, label: {
            Image(systemName: "xmark")
                .font(.headline)
                .foregroundColor(.theme.ctAccent)
        })
    }
}

#Preview {
    XMarkButton()
}
