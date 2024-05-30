// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI
import Components
import Scenes

public struct RootView: View {
    @StateObject private var vm = DashboardViewModel()
    
    public init() {}

    public var body: some View {
        NavigationView {
             HomeView()
                .navigationBarHidden(true)
        }.environmentObject(vm)
    }
}
