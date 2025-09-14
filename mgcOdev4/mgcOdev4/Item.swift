//
//  Item.swift
//  mgcOdev4
//
//  Created by Rabia Yolcu on 10.09.2025.
//

import SwiftUI

// MARK: - Item Model
struct ListItem: Identifiable, Codable {
    let id = UUID()
    var title: String
    var description: String
    var isCompleted: Bool = false
    var symbolName: String
    
    init(title: String, description: String, isCompleted: Bool = false) {
        self.title = title
        self.description = description
        self.isCompleted = isCompleted
        self.symbolName = Self.randomSymbol()
    }
    
    static func randomSymbol() -> String {
        let symbols = [
            "star.fill", "heart.fill", "bolt.fill", "leaf.fill",
            "flame.fill", "drop.fill", "moon.fill", "sun.max.fill",
            "cloud.fill", "snowflake", "tornado", "rainbow"
        ]
        return symbols.randomElement() ?? "star.fill"
    }
}
