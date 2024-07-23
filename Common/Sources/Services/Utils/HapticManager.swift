//
//  HapticManager.swift
//
//
//  Created by William von Arend on 23/07/2024.
//

import Foundation
import SwiftUI

public class HapticManager {
    static private let generator = UINotificationFeedbackGenerator()
    
    static public func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
}
