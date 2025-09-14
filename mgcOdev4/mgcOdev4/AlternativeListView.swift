//
//  AlternativeListView.swift
//  mgcOdev4
//
//  Created by Rabia Yolcu on 10.09.2025.
//

import SwiftUI

struct AlternativeListView: View {
    @StateObject private var listManager = ListManager()
    @State private var backgroundColor = Color.purple
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 10) {
                    ForEach(listManager.items) { item in
                        NavigationLink(destination: DetailView(item: $listManager.items[listManager.items.firstIndex(where: { $0.id == item.id })!])) {
                            AlternativeRowView(item: item)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding()
            }
            .background(backgroundColor.opacity(0.1))
            .navigationTitle("Alternative View")
            .onAppear {
                let colors: [Color] = [.purple, .indigo, .teal, .mint, .cyan]
                backgroundColor = colors.randomElement() ?? .purple
            }
        }
    }
}

struct AlternativeRowView: View {
    let item: ListItem
    
    var body: some View {
        HStack {
            Image(systemName: item.symbolName)
                .font(.title)
                .foregroundColor(.white)
                .frame(width: 50, height: 50)
                .background(item.isCompleted ? .green : .blue)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text(item.description)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }
            
            Spacer()
            
            if item.isCompleted {
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(.green)
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(radius: 2)
    }
}

