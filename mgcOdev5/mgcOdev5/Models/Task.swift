//
//  Task.swift
//  mgcOdev5
//
//  Created by Rabia Yolcu on 14.09.2025.
//

import Foundation

// MARK: - Task Model
struct Task: Identifiable, Codable {
    let id = UUID()
    var title: String
    var isCompleted: Bool
    let createdAt: Date
    
    init(title: String, isCompleted: Bool = false) {
        self.title = title
        self.isCompleted = isCompleted
        self.createdAt = Date()
    }
}
