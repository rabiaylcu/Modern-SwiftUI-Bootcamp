//
//  EventDetailView.swift
//  mgcOdev6
//
//  Created by Rabia Yolcu on 14.09.2025.
//

import SwiftUI

// Etkinlik detay sayfası
struct EventDetailView: View {
    let event: Event
    @ObservedObject var viewModel: EventViewModel
    @Environment(\.presentationMode) var presentationMode
    @State private var showingDeleteAlert = false
    
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        formatter.timeStyle = .short
        formatter.locale = Locale(identifier: "tr_TR")
        return formatter
    }
    
    private var timeUntilEvent: String {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day, .hour, .minute], from: Date(), to: event.date)
        
        if let days = components.day, let hours = components.hour, let minutes = components.minute {
            if days > 0 {
                return "\(days) gün, \(hours) saat kaldı"
            } else if hours > 0 {
                return "\(hours) saat, \(minutes) dakika kaldı"
            } else if minutes > 0 {
                return "\(minutes) dakika kaldı"
            } else {
                return "Etkinlik zamanı geldi!"
            }
        }
        return ""
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // Başlık ve İkon
                HStack {
                    Text(event.type.icon)
                        .font(.system(size: 50))
                    
                    VStack(alignment: .leading) {
                        Text(event.title)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.leading)
                        
                        Text(event.type.rawValue)
                            .font(.title3)
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                }
                .padding()
                
                // Tarih ve Saat Kartı
                VStack(alignment: .leading, spacing: 10) {
                    Label("Tarih ve Saat", systemImage: "calendar")
                        .font(.headline)
                    
                    Text(dateFormatter.string(from: event.date))
                        .font(.title2)
                        .foregroundColor(.primary)
                    
                    if event.date > Date() {
                        Text(timeUntilEvent)
                            .font(.subheadline)
                            .foregroundColor(.orange)
                            .fontWeight(.medium)
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)
                
                // Hatırlatıcı Kartı
                HStack {
                    Label("Hatırlatıcı", systemImage: event.hasReminder ? "bell.fill" : "bell.slash")
                        .font(.headline)
                    
                    Spacer()
                    
                    Toggle("", isOn: Binding(
                        get: { event.hasReminder },
                        set: { _ in viewModel.toggleReminder(for: event) }
                    ))
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(12)
                
                // Sil Butonu
                Button(action: {
                    showingDeleteAlert = true
                }) {
                    HStack {
                        Image(systemName: "trash")
                        Text("Etkinliği Sil")
                    }
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.red)
                    .cornerRadius(12)
                }
                .padding(.top)
                
                Spacer()
            }
            .padding()
        }
        .navigationTitle("Etkinlik Detayı")
        .navigationBarTitleDisplayMode(.inline)
        .alert("Etkinliği Sil", isPresented: $showingDeleteAlert) {
            Button("İptal", role: .cancel) { }
            Button("Sil", role: .destructive) {
                viewModel.deleteEvent(event)
                presentationMode.wrappedValue.dismiss()
            }
        } message: {
            Text("Bu etkinliği silmek istediğinizden emin misiniz? Bu işlem geri alınamaz.")
        }
    }
}

#Preview {
    NavigationView {
        EventDetailView(
            event: Event(title: "Örnek Etkinlik", date: Date(), type: .birthday, hasReminder: true),
            viewModel: EventViewModel()
        )
    }
}
