//
//  File.swift
//  
//
//  Created by William von Arend on 30/04/2024.
//

import SwiftUI
import ThemeManager

public struct CTCard<Content: View>: View {
    var content: Content
    
    public init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    public var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.theme.ctAccent)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.gray, lineWidth: 1)
            ).overlay(
                content
            )
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            CTCard {
                Text("This is a card container component")
                    .font(.title)
                    .foregroundColor(.black)
                    .background(Color.blue)
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 300)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
