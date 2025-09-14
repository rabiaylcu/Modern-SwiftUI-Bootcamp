//
//  EventListView.swift
//  mgcOdev6
//
//  Created by Rabia Yolcu on 14.09.2025.
//

import SwiftUI

// Ana etkinlik listesi ekranı
struct EventListView: View {
    @StateObject private var viewModel = EventViewModel()
    @State private var showingAddEvent = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.events) { event in
                    NavigationLink(destination: EventDetailView(event: event, viewModel: viewModel)) {
                        EventRowView(event: event)
                    }
                }
                .onDelete(perform: viewModel.deleteEvent)
            }
            .navigationTitle("Etkinliklerim")
            .navigationBarItems(trailing:
                Button(action: {
                    showingAddEvent = true
                }) {
                    Image(systemName: "plus")
                        .font(.title2)
                }
            )
            .sheet(isPresented: $showingAddEvent) {
                AddEventView(viewModel: viewModel)
            }
        }
    }
}

// Liste satırı görünümü
struct EventRowView: View {
    let event: Event
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        formatter.locale = Locale(identifier: "tr_TR")
        return formatter
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Text(event.type.icon)
                        .font(.title2)
                    Text(event.title)
                        .font(.headline)
                        .foregroundColor(.primary)
                }
                
                Text(dateFormatter.string(from: event.date))
                    .font(.caption)
                    .foregroundColor(.secondary)
                
                Text(event.type.rawValue)
                    .font(.caption)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 2)
                    .background(Color.blue.opacity(0.2))
                    .cornerRadius(8)
            }
            
            Spacer()
            
            if event.hasReminder {
                Image(systemName: "bell.fill")
                    .foregroundColor(.orange)
                    .font(.caption)
            }
        }
        .padding(.vertical, 4)
    }
}

#Preview {
    EventListView()
}
