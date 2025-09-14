//
//  NoteDetailView.swift
//  mgcOdev7
//
//  Created by Rabia Yolcu on 14.09.2025.
//

import SwiftUI

struct NoteDetailView: View {
    @State var note: Note
    @ObservedObject var viewModel: NotesViewModel
    @Environment(\.dismiss) private var dismiss
    
    @State private var isEditing = false
    @State private var editedTitle: String = ""
    @State private var editedContent: String = ""
    @State private var showingDeleteAlert = false
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Tarih bilgisi
                HStack {
                    Image(systemName: "calendar")
                        .foregroundColor(.secondary)
                    Text(note.formattedDate)
                        .font(.caption)
                        .foregroundColor(.secondary)
                    Spacer()
                }
                .padding(.horizontal)
                
                if isEditing {
                    // Düzenleme modu
                    VStack(spacing: 16) {
                        TextField("Başlık", text: $editedTitle)
                            .font(.title2)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                        TextEditor(text: $editedContent)
                            .frame(minHeight: 200)
                            .padding(8)
                            .background(Color(.systemGray6))
                            .cornerRadius(8)
                    }
                    .padding(.horizontal)
                } else {
                    // Görüntüleme modu
                    VStack(alignment: .leading, spacing: 16) {
                        Text(note.title)
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        if !note.content.isEmpty {
                            Text(note.content)
                                .font(.body)
                                .lineSpacing(4)
                        } else {
                            Text("İçerik yok")
                                .font(.body)
                                .foregroundColor(.secondary)
                                .italic()
                        }
                    }
                    .padding(.horizontal)
                }
                
                Spacer(minLength: 50)
            }
        }
        .navigationTitle("Not Detayı")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                if isEditing {
                    Button("İptal") {
                        cancelEditing()
                    }
                    
                    Button("Kaydet") {
                        saveChanges()
                    }
                    .disabled(editedTitle.trimmingCharacters(in: .whitespaces).isEmpty)
                } else {
                    Menu {
                        Button(action: startEditing) {
                            Label("Düzenle", systemImage: "pencil")
                        }
                        
                        Button(role: .destructive, action: {
                            showingDeleteAlert = true
                        }) {
                            Label("Sil", systemImage: "trash")
                        }
                    } label: {
                        Image(systemName: "ellipsis.circle")
                    }
                }
            }
        }
        .alert("Not Sil", isPresented: $showingDeleteAlert) {
            Button("Sil", role: .destructive) {
                deleteNote()
            }
            Button("İptal", role: .cancel) { }
        } message: {
            Text("Bu notu silmek istediğinizden emin misiniz?")
        }
        .onAppear {
            editedTitle = note.title
            editedContent = note.content
        }
    }
    
    private func startEditing() {
        editedTitle = note.title
        editedContent = note.content
        isEditing = true
    }
    
    private func cancelEditing() {
        editedTitle = note.title
        editedContent = note.content
        isEditing = false
    }
    
    private func saveChanges() {
        let trimmedTitle = editedTitle.trimmingCharacters(in: .whitespaces)
        
        guard !trimmedTitle.isEmpty else { return }
        
        var updatedNote = note
        updatedNote.title = trimmedTitle
        updatedNote.content = editedContent
        updatedNote.date = Date() // Güncelleme tarihini yenile
        
        viewModel.updateNote(updatedNote)
        note = updatedNote
        isEditing = false
    }
    
    private func deleteNote() {
        if let index = viewModel.notes.firstIndex(where: { $0.id == note.id }) {
            viewModel.deleteNote(at: IndexSet(integer: index))
            dismiss()
        }
    }
}

#Preview {
    NavigationView {
        NoteDetailView(
            note: Note(title: "Örnek Not", content: "Bu bir örnek not içeriğidir."),
            viewModel: NotesViewModel()
        )
    }
}
