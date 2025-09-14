//
//  AccountDetailsView.swift
//  mgc4
//
//  Created by Rabia Yolcu on 10.09.2025.
//

import SwiftUI

struct AccountDetailsView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("HESAP BİLGİLERİ") {
                    HStack {
                        Text("Hesap Tipi")
                        Spacer()
                        Text("Vadesiz Hesap")
                            .foregroundColor(.secondary)
                    }
                    
                    HStack {
                        Text("Hesap No")
                        Spacer()
                        Text("TR100100200300400001")
                            .foregroundColor(.secondary)
                    }
                    
                    HStack {
                        Text("Para Birimi")
                        Spacer()
                        Text("TRY")
                            .foregroundColor(.secondary)
                    }
                    
                    HStack {
                        Text("Durum")
                        Spacer()
                        Text("Aktif")
                            .foregroundColor(.secondary)
                    }
                }
                
                Section("İŞLEMLER") {
                    HStack {
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Fatura Ödemesi")
                                .fontWeight(.medium)
                            HStack {
                                Text("2025-09-27")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                Spacer()
                                Text("Elektrik Faturası")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
                        Spacer()
                        Text("-620.4")
                            .foregroundColor(.red)
                            .fontWeight(.medium)
                    }.listRowBackground(Color.red.opacity(0.2))
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Yemek Siparişi")
                                .fontWeight(.medium)
                            HStack {
                                Text("2025-09-27")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                Spacer()
                                Text("Restoran")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
                        Spacer()
                        Text("-189.9")
                            .foregroundColor(.red)
                            .fontWeight(.medium)
                    }.listRowBackground(Color.red.opacity(0.2))
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 2) {
                            Text("ATM Para Yatırma")
                                .fontWeight(.medium)
                            HStack {
                                Text("2025-09-26")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                Spacer()
                                Text("ATM İşlemi")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
                        Spacer()
                        Text("+1000.0")
                            .foregroundColor(.red)
                            .fontWeight(.medium)
                    }.listRowBackground(Color.green.opacity(0.2))
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Maaş Yatışı")
                                .fontWeight(.medium)
                            HStack {
                                Text("2025-09-25")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                Spacer()
                                Text("Şirket Ödemesi")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
                        Spacer()
                        Text("18000.0")
                            .foregroundColor(.green)
                            .fontWeight(.medium)
                    }.listRowBackground(Color.green.opacity(0.2))
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Market Alışverişi")
                                .fontWeight(.medium)
                            HStack {
                                Text("2025-09-24")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                Spacer()
                                Text("Süpermarket")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
                        Spacer()
                        Text("-462.3")
                            .foregroundColor(.red)
                            .fontWeight(.medium)
                    }.listRowBackground(Color.red.opacity(0.2))
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Dijital Abonelik")
                                .fontWeight(.medium)
                            HStack {
                                Text("2025-09-23")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                Spacer()
                                Text("Dijital Hizmet")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
                        Spacer()
                        Text("-59.99")
                            .foregroundColor(.red)
                            .fontWeight(.medium)
                    }.listRowBackground(Color.red.opacity(0.2))
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Akaryakıt Alımı")
                                .fontWeight(.medium)
                            HStack {
                                Text("2025-09-22")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                Spacer()
                                Text("Benzin İstasyonu")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
                        Spacer()
                        Text("-1250.0")
                            .foregroundColor(.red)
                            .fontWeight(.medium)
                    }.listRowBackground(Color.red.opacity(0.2))
                }
            }
            .navigationTitle("Hesap Detayı")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Edit") {
                        // Edit action
                    }
                    .foregroundColor(.blue)
                }
            }
        }
    }
}


#Preview {
    AccountDetailsView()
}
