//
//  ContentView.swift
//  mgcOdev8
//
//  Created by Rabia Yolcu on 14.09.2025.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var searchText = ""
    @State private var showingAddNote = false
    
    @FetchRequest(
        entity: Note.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \Note.date, ascending: false)]
    ) var notes: FetchedResults<Note>
    
    // Arama için filtrelenmiş notlar
    var filteredNotes: [Note] {
        if searchText.isEmpty {
            return Array(notes)
        } else {
            return notes.filter { note in
                note.title?.lowercased().contains(searchText.lowercased()) ?? false
            }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                // Arama Çubuğu
                SearchBar(text: $searchText)
                    .padding(.horizontal)
                
                // Not Listesi
                List {
                    ForEach(filteredNotes, id: \.self) { note in
                        NavigationLink(destination: NoteDetailView(note: note)) {
                            NoteRowView(note: note)
                        }
                    }
                    .onDelete(perform: deleteNotes)
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Notlarım")
            .navigationBarItems(trailing:
                Button(action: {
                    showingAddNote = true
                }) {
                    Image(systemName: "plus")
                        .font(.title2)
                }
            )
            .sheet(isPresented: $showingAddNote) {
                AddNoteView()
            }
        }
    }
    
    private func deleteNotes(offsets: IndexSet) {
        withAnimation {
            offsets.map { filteredNotes[$0] }.forEach(viewContext.delete)
            PersistenceController.shared.save()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.shared.container.viewContext)
    }
}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
