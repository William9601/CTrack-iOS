// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI
//import Assets

public struct PrimaryButton: View {
    let title: String
    let action: () -> Void

    public init(title: String, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }

    public var body: some View {
        Button(title, action: action)
            .buttonStyle(.borderedProminent)
            .background(Color(.black))
//            .foregroundColor(Color.ctPrimary)
            .foregroundColor(.theme.ctGreen)
    }
}
