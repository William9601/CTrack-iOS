// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI
import Components
import Core

public struct RootView: View {
    public init() {}

    public var body: some View {
        NavigationView {
             LivePrices()
                .navigationBarHidden(true)
        }
    }
}

//public struct RootView: App {
//    public init() {}
//
//    public var body: some Scene {
//        WindowGroup {
//            VStack {
//                Dashboard()
//            }.padding(.horizontal, 25)
//        }
//    }
//}
