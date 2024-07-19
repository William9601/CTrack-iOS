// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI
import Components
import Scenes
import ThemeManager
import Services

public struct RootView: View {
    
    @StateObject private var vm: HomeViewModel
    
    public init(marketDataService: MarketDataServiceProtocol) {
        _vm = StateObject(wrappedValue: HomeViewModel(marketDataService: marketDataService))
        
        ThemeManager.shared.setTheme(.autumn)
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color.theme.ctAccent)] // Set color of navigation bar titles
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor(Color.theme.ctAccent)]
    }

    public var body: some View {
        NavigationView {
             HomeView()
                .navigationBarHidden(true)
        }.environmentObject(vm)
    }
}
