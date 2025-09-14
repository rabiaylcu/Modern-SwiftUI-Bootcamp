//
//  ContentView.swift
//  mgcOdev4
//
//  Created by Rabia Yolcu on 10.09.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var listManager = ListManager()
    @State private var showingAddSheet = false
    @State private var backgroundColor = Color.blue
    
    var body: some View {
        NavigationView {
            ZStack {
                // Dinamik arka plan rengi
                backgroundColor
                    .opacity(0.1)
                    .ignoresSafeArea()
                
                List {
                    // Tamamlanacaklar Bölümü
                    Section("Tamamlanacaklar") {
                        ForEach(listManager.incompleteItems) { item in
                            NavigationLink(destination: DetailView(item: $listManager.items[listManager.items.firstIndex(where: { $0.id == item.id })!])) {
                                ListRowView(item: item)
                            }
                        }
                        .onDelete { indexSet in
                            listManager.deleteIncompleteItems(at: indexSet)
                        }
                    }
                    
                    // Tamamlananlar Bölümü
                    Section("Tamamlananlar") {
                        ForEach(listManager.completedItems) { item in
                            NavigationLink(destination: DetailView(item: $listManager.items[listManager.items.firstIndex(where: { $0.id == item.id })!])) {
                                ListRowView(item: item)
                            }
                        }
                        .onDelete { indexSet in
                            listManager.deleteCompletedItems(at: indexSet)
                        }
                    }
                }
                .navigationTitle("MasterListApp")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(action: {
                            showingAddSheet = true
                        }) {
                            Image(systemName: "plus")
                        }
                    }
                }
                .sheet(isPresented: $showingAddSheet) {
                    AddItemView(listManager: listManager)
                }
                .onAppear {
                    // Rastgele renk teması
                    let colors: [Color] = [.blue, .green, .purple, .orange, .pink, .red]
                    backgroundColor = colors.randomElement() ?? .blue
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
