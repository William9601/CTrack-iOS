// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI
import Components
import Scenes
import ThemeManager

public struct RootView: View {
    @StateObject private var vm = HomeViewModel()
    
    public init() {
        ThemeManager.shared.setTheme(.summer)
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color.theme.ctAccent)] // Set color of natigation bar titles
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color.theme.ctAccent)]
    }

    public var body: some View {
        NavigationView {
             HomeView()
                .navigationBarHidden(true)
        }.environmentObject(vm)
    }
}
