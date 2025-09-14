//
//  DetailView.swift
//  mgcOdev4
//
//  Created by Rabia Yolcu on 10.09.2025.
//

import SwiftUI

struct DetailView: View {
    @Binding var item: ListItem
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                // SF Symbol Gösterimi
                Image(systemName: item.symbolName)
                    .font(.system(size: 120))
                    .foregroundColor(item.isCompleted ? .green : .blue)
                    .padding()
                
                VStack(spacing: 20) {
                    // Başlık
                    Text(item.title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    
                    // Açıklama
                    Text(item.description)
                        .font(.body)
                        .foregroundColor(.secondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    // Durum Göstergesi
                    HStack {
                        Text("Durum:")
                            .font(.headline)
                        
                        Text(item.isCompleted ? "Tamamlandı" : "Bekliyor")
                            .font(.headline)
                            .foregroundColor(item.isCompleted ? .green : .orange)
                    }
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(10)
                    
                    // Durum Değiştirme Butonu
                    Button(action: {
                        item.isCompleted.toggle()
                    }) {
                        HStack {
                            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                            Text(item.isCompleted ? "Tamamlandı Olarak İşaretle" : "Bekliyor Olarak İşaretle")
                        }
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(item.isCompleted ? .green : .blue)
                        .cornerRadius(10)
                    }
                }
                .padding()
                
                Spacer()
            }
        }
        .navigationTitle("Detaylar")
        .navigationBarTitleDisplayMode(.inline)
    }
}
