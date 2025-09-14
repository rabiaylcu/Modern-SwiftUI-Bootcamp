//
//  Note.swift
//  mgcOdev7
//
//  Created by Rabia Yolcu on 14.09.2025.
//

import Foundation

struct Note: Identifiable, Codable {
    let id = UUID()
    var title: String
    var content: String
    var date: Date
    
    init(title: String, content: String) {
        self.title = title
        self.content = content
        self.date = Date()
    }
    
    // Tarih formatı için hesaplanan özellik
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        formatter.locale = Locale(identifier: "tr_TR")
        return formatter.string(from: date)
    }
}
