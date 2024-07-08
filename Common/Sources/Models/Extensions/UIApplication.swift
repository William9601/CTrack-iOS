//
//  UIApplication.swift
//
//
//  Created by William von Arend on 04/07/2024.
//

import SwiftUI

extension UIApplication {
    public func endEditing() { // Dismiss the keyboard
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

