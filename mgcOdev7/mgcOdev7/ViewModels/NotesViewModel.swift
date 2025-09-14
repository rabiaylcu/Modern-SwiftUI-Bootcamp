//
//  NotesViewModel.swift
//  mgcOdev7
//
//  Created by Rabia Yolcu on 14.09.2025.
//

import Foundation
import SwiftUI

class NotesViewModel: ObservableObject {
    @Published var notes: [Note] = []
    
    private let userDefaults = UserDefaults.standard
    private let notesKey = "SavedNotes"
    
    init() {
        loadNotes()
    }
    
    // MARK: - Veri Yükleme
    func loadNotes() {
        if let data = userDefaults.data(forKey: notesKey) {
            do {
                let decoder = JSONDecoder()
                notes = try decoder.decode([Note].self, from: data)
                // Tarihe göre sırala (en yeni önce)
                notes.sort { $0.date > $1.date }
            } catch {
                print("Not yükleme hatası: \(error.localizedDescription)")
                notes = []
            }
        }
    }
    
    // MARK: - Veri Kaydetme
    func saveNotes() {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(notes)
            userDefaults.set(data, forKey: notesKey)
        } catch {
            print("Not kaydetme hatası: \(error.localizedDescription)")
        }
    }
    
    // MARK: - Not Ekleme
    func addNote(title: String, content: String) {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else { return }
        
        let newNote = Note(title: title, content: content)
        notes.insert(newNote, at: 0) // En üste ekle
        saveNotes()
    }
    
    // MARK: - Not Silme
    func deleteNote(at indexSet: IndexSet) {
        notes.remove(atOffsets: indexSet)
        saveNotes()
    }
    
    // MARK: - Not Güncelleme
    func updateNote(_ note: Note) {
        if let index = notes.firstIndex(where: { $0.id == note.id }) {
            notes[index] = note
            // Tarihe göre tekrar sırala
            notes.sort { $0.date > $1.date }
            saveNotes()
        }
    }
}
