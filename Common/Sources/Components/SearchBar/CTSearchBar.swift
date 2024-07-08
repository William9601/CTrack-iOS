//
//  CTSearchBar.swift
//
//
//  Created by William von Arend on 04/07/2024.
//

import SwiftUI

public struct CTSearchBar: View {
    
    @Binding var searchText: String
    
    public init(searchText: Binding<String>) {
        _searchText = searchText
    }
    
    public var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(searchText.isEmpty
                                 ? .theme.ctSecondaryText
                                 : .theme.ctAccent)
            
            TextField("Search by name or symbol...", text: $searchText)
                .foregroundColor(.theme.ctAccent)
                .disableAutocorrection(true)
                .overlay(
                    Image(systemName: "xmark.circle.fill")
                        .padding()
                        .offset(x: 10)
                        .foregroundColor(.theme.ctAccent)
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            UIApplication.shared.endEditing()
                            searchText = ""
                        }
                    ,alignment: .trailing
                )
            
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: .ctDimensions.cornerRadiusRound)
                .fill(Color.theme.ctBackgroundColor)
                .shadow(color: .theme.ctAccent.opacity(0.15), radius: 10, x: 0, y: 0)
        )
    }
}

#Preview {
    CTSearchBar(searchText: .constant(""))
}
