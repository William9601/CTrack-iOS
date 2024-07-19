//
//  StatisticsModel.swift
//
//
//  Created by William von Arend on 05/07/2024.
//

import Foundation

public struct StatisticsModel: Identifiable, Equatable {
    public let id = UUID().uuidString
    public let title: String
    public let value: String
    public let percentageChange: Double?
    
    public init(title: String,
         value: String,
         percentageChange: Double? = nil) {
        self.title = title
        self.value = value
        self.percentageChange = percentageChange
    }
}
