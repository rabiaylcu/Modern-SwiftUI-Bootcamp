//
//  NoteDetailView.swift
//  mgcOdev8
//
//  Created by Rabia Yolcu on 14.09.2025.
//

import SwiftUI

struct NoteDetailView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @ObservedObject var note: Note
    
    @State private var editedTitle: String
    @State private var editedContent: String
    @State private var isEditing = false
    
    init(note: Note) {
        self.note = note
        self._editedTitle = State(initialValue: note.title ?? "")
        self._editedContent = State(initialValue: note.content ?? "")
    }
    
    var body: some View {
        VStack(spacing: 16) {
            if isEditing {
                TextField("Başlık", text: $editedTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .font(.title2)
                
                TextEditor(text: $editedContent)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.gray.opacity(0.3), lineWidth: 1)
                    )
            } else {
                VStack(alignment: .leading, spacing: 12) {
                    Text(note.title ?? "Başlıksız Not")
                        .font(.title)
                        .bold()
                    
                    Text(dateFormatter.string(from: note.date ?? Date()))
                        .font(.caption)
                        .foregroundColor(.secondary)
                    
                    Divider()
                    
                    ScrollView {
                        Text(note.content ?? "")
                            .font(.body)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }
            
            Spacer()
        }
        .padding()
        .navigationBarItems(trailing:
            Button(isEditing ? "Kaydet" : "Düzenle") {
                if isEditing {
                    saveChanges()
                } else {
                    isEditing = true
                }
            }
        )
    }
    
    private func saveChanges() {
        note.title = editedTitle.trimmingCharacters(in: .whitespaces)
        note.content = editedContent
        note.date = Date()
        
        PersistenceController.shared.save()
        isEditing = false
    }
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.timeStyle = .short
        formatter.locale = Locale(identifier: "tr_TR")
        return formatter
    }
}

struct NoteDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.shared.container.viewContext
        let note = Note(context: context)
        note.title = "Örnek Not"
        note.content = "Bu bir örnek not içeriğidir."
        note.date = Date()
        
        return NoteDetailView(note: note)
    }
}
