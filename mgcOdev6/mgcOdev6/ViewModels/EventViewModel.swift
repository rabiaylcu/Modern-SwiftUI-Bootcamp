//
//  EventViewModel.swift
//  mgcOdev6
//
//  Created by Rabia Yolcu on 14.09.2025.
//

import Foundation

// EventViewModel - etkinlik işlemlerini yöneten sınıf
class EventViewModel: ObservableObject {
    @Published var events: [Event] = []
    
    init() {
        // Test verileri ekleyelim
        addSampleData()
    }
    
    // Yeni etkinlik ekleme
    func addEvent(_ event: Event) {
        events.append(event)
    }
    
    // Etkinlik silme
    func deleteEvent(_ event: Event) {
        events.removeAll { $0.id == event.id }
    }
    
    // ID'ye göre etkinlik silme
    func deleteEvent(at offsets: IndexSet) {
        events.remove(atOffsets: offsets)
    }
    
    // Hatırlatıcı durumunu güncelleme
    func toggleReminder(for event: Event) {
        if let index = events.firstIndex(where: { $0.id == event.id }) {
            events[index].hasReminder.toggle()
        }
    }
    
    // Etkinlik güncelleme
    func updateEvent(_ updatedEvent: Event) {
        if let index = events.firstIndex(where: { $0.id == updatedEvent.id }) {
            events[index] = updatedEvent
        }
    }
    
    // Örnek veriler ekleme
    private func addSampleData() {
        let sampleEvents = [
            Event(title: "Ali'nin Doğum Günü", date: Calendar.current.date(byAdding: .day, value: 3, to: Date()) ?? Date(), type: .birthday, hasReminder: true),
            Event(title: "Proje Toplantısı", date: Calendar.current.date(byAdding: .day, value: 1, to: Date()) ?? Date(), type: .meeting, hasReminder: true),
            Event(title: "Antalya Tatili", date: Calendar.current.date(byAdding: .day, value: 10, to: Date()) ?? Date(), type: .holiday, hasReminder: false)
        ]
        
        events.append(contentsOf: sampleEvents)
    }
}
