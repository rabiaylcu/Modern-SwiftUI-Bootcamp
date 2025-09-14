//
//  ListManager.swift
//  mgcOdev4
//
//  Created by Rabia Yolcu on 10.09.2025.
//

import SwiftUI

class ListManager: ObservableObject {
    @Published var items: [ListItem] = []
    
    init() {
        loadInitialData()
    }
    
    var incompleteItems: [ListItem] {
        items.filter { !$0.isCompleted }
    }
    
    var completedItems: [ListItem] {
        items.filter { $0.isCompleted }
    }
    
    func addItem(_ item: ListItem) {
        items.append(item)
    }
    
    func deleteIncompleteItems(at offsets: IndexSet) {
        let incompleteItems = self.incompleteItems
        for index in offsets {
            if let itemIndex = items.firstIndex(where: { $0.id == incompleteItems[index].id }) {
                items.remove(at: itemIndex)
            }
        }
    }
    
    func deleteCompletedItems(at offsets: IndexSet) {
        let completedItems = self.completedItems
        for index in offsets {
            if let itemIndex = items.firstIndex(where: { $0.id == completedItems[index].id }) {
                items.remove(at: itemIndex)
            }
        }
    }
    
    private func loadInitialData() {
        items = [
            ListItem(title: "SwiftUI Öğren", description: "SwiftUI framework'ünün temellerini öğren ve pratik yap"),
            ListItem(title: "Spor Yap", description: "Haftada en az 3 gün düzenli egzersiz yap"),
            ListItem(title: "Kitap Oku", description: "Bu ay en az 2 kitap oku ve notlar al"),
            ListItem(title: "Proje Tamamla", description: "iOS uygulama projesini bitir ve App Store'a yükle", isCompleted: true),
            ListItem(title: "Alışveriş Yap", description: "Market alışverişini tamamla ve haftalık planı yap"),
            ListItem(title: "Doktor Randevusu", description: "Yıllık kontrol için doktor randevusu al", isCompleted: true),
            ListItem(title: "Arkadaşlarla Buluş", description: "Bu hafta arkadaşlarla kahve içme planı yap"),
            ListItem(title: "Ev Temizliği", description: "Genel ev temizliği yap ve düzenleme yap"),
            ListItem(title: "Yeni Dil Öğren", description: "İspanyolca derslere başla ve günlük pratik yap"),
            ListItem(title: "Finansal Plan", description: "Aylık bütçe planı yap ve harcamaları kontrol et", isCompleted: true)
        ]
    }
}

