//
//  AddEventView.swift
//  mgcOdev6
//
//  Created by Rabia Yolcu on 14.09.2025.
//

import SwiftUI

// Yeni etkinlik ekleme modal ekranı
struct AddEventView: View {
    @ObservedObject var viewModel: EventViewModel
    @Environment(\.presentationMode) var presentationMode
    
    @State private var title = ""
    @State private var date = Date()
    @State private var selectedType = EventType.meeting
    @State private var hasReminder = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Etkinlik Bilgileri")) {
                    TextField("Etkinlik Adı", text: $title)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    DatePicker("Tarih ve Saat", selection: $date, displayedComponents: [.date, .hourAndMinute])
                        .datePickerStyle(DefaultDatePickerStyle())
                }
                
                Section(header: Text("Etkinlik Türü")) {
                    Picker("Tür", selection: $selectedType) {
                        ForEach(EventType.allCases, id: \.self) { type in
                            HStack {
                                Text(type.icon)
                                Text(type.rawValue)
                            }
                            .tag(type)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                
                Section(header: Text("Hatırlatıcı")) {
                    Toggle("Hatırlatıcı Açık", isOn: $hasReminder)
                        .toggleStyle(SwitchToggleStyle())
                }
                
                Section {
                    HStack {
                        Spacer()
                        Button("Etkinlik Ekle") {
                            addEvent()
                        }
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(title.isEmpty ? Color.gray : Color.blue)
                        .cornerRadius(10)
                        .disabled(title.isEmpty)
                        Spacer()
                    }
                }
            }
            .navigationTitle("Yeni Etkinlik")
            .navigationBarItems(
                leading: Button("İptal") {
                    presentationMode.wrappedValue.dismiss()
                },
                trailing: Button("Kaydet") {
                    addEvent()
                }
                .disabled(title.isEmpty)
            )
        }
    }
    
    private func addEvent() {
        let newEvent = Event(
            title: title,
            date: date,
            type: selectedType,
            hasReminder: hasReminder
        )
        
        viewModel.addEvent(newEvent)
        presentationMode.wrappedValue.dismiss()
    }
}

#Preview {
    AddEventView(viewModel: EventViewModel())
}
