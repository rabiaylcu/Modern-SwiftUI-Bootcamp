//
//  NoteRowView.swift
//  mgcOdev8
//
//  Created by Rabia Yolcu on 14.09.2025.
//

import SwiftUI

struct NoteRowView: View {
    let note: Note
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(note.title ?? "Başlıksız Not")
                .font(.headline)
                .lineLimit(1)
            
            Text(note.content ?? "")
                .font(.subheadline)
                .foregroundColor(.gray)
                .lineLimit(2)
            
            Text(dateFormatter.string(from: note.date ?? Date()))
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding(.vertical, 4)
    }
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        formatter.locale = Locale(identifier: "tr_TR")
        return formatter
    }
}

struct NoteRowView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.shared.container.viewContext
        let note = Note(context: context)
        note.title = "Örnek Not"
        note.content = "Bu bir örnek not içeriğidir."
        note.date = Date()
        
        return NoteRowView(note: note)
    }
}

