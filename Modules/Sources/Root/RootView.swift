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
//            PrimaryButton(title: "Some Title", action: {})
            CTCard {
                HStack {
                    VStack {
                        Text("Total").font(.title3).foregroundColor(Color.theme.ctBackgroundColor)
                        Text("£3,500").font(.title).foregroundColor(Color.theme.ctGreen)
                    }
                }
            }.frame(width: 370, height: 90)
        }
        .padding()
    }
}

//struct MyView: View {
//    @State private var currentTheme: Themes = .midnight // Set initial theme
//    
//    var body: some View {
//        VStack {
//            // Your UI components here
//        }
//        .environment(\.theme, currentTheme)
//        .onAppear {
//            ThemeManager.shared.setTheme(currentTheme)
//        }
//    }
//}
