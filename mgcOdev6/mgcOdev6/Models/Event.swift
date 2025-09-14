//
//  Event.swift
//  mgcOdev6
//
//  Created by Rabia Yolcu on 14.09.2025.
//

import Foundation

// Event modeli - etkinlik bilgilerini tutar
struct Event: Identifiable, Codable {
    let id = UUID()
    var title: String
    var date: Date
    var type: EventType
    var hasReminder: Bool
    
    init(title: String, date: Date, type: EventType, hasReminder: Bool = false) {
        self.title = title
        self.date = date
        self.type = type
        self.hasReminder = hasReminder
    }
}

// Etkinlik türleri enum'u
enum EventType: String, CaseIterable, Codable {
    case birthday = "Doğum Günü"
    case meeting = "Toplantı"
    case holiday = "Tatil"
    case sports = "Spor"
    case other = "Diğer"
    
    var icon: String {
        switch self {
        case .birthday:
            return "🎂"
        case .meeting:
            return "💼"
        case .holiday:
            return "🏖️"
        case .sports:
            return "⚽"
        case .other:
            return "📝"
        }
    }
}
