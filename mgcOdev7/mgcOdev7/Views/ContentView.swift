//
//  ContentView.swift
//  mgcOdev7
//
//  Created by Rabia Yolcu on 14.09.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = NotesViewModel()
    @State private var showingAddNote = false
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.notes.isEmpty {
                    // Boş durum gösterimi
                    VStack(spacing: 20) {
                        Image(systemName: "note.text")
                            .font(.system(size: 80))
                            .foregroundColor(.gray)
                        
                        Text("Henüz not yok")
                            .font(.title2)
                            .foregroundColor(.gray)
                        
                        Text("İlk notunu eklemek için + butonuna bas")
                            .font(.body)
                            .foregroundColor(.secondary)
                            .multilineTextAlignment(.center)
                    }
                    .padding()
                } else {
                    // Notlar listesi
                    List {
                        ForEach(viewModel.notes) { note in
                            NavigationLink(destination: NoteDetailView(note: note, viewModel: viewModel)) {
                                NoteRowView(note: note)
                            }
                        }
                        .onDelete(perform: viewModel.deleteNote)
                    }
                }
            }
            .navigationTitle("Notlarım")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showingAddNote = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddNote) {
                AddNoteView(viewModel: viewModel)
            }
        }
    }
}

// MARK: - Not Satır Görünümü
struct NoteRowView: View {
    let note: Note
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(note.title)
                .font(.headline)
                .lineLimit(1)
            
            Text(note.content)
                .font(.body)
                .foregroundColor(.secondary)
                .lineLimit(2)
            
            Text(note.formattedDate)
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding(.vertical, 2)
    }
}

#Preview {
    ContentView()
}
