// The Swift Programming Language
// https://docs.swift.org/swift-book

import Components
import SwiftUI

public struct RootView: View {
    public init() {}

    public var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            PrimaryButton(title: "Some Title", action: {})
        }
        .padding()
    }
}
