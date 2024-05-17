// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI
import Components
import Views



public struct RootView: View {
    public init() {}

    public var body: some View {
        VStack {
            Dashboard()
            PortfolioBox()
        }
    }
}
