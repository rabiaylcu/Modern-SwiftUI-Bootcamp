//
//  ContentView.swift
//  mgc4
//
//  Created by Rabia Yolcu on 10.09.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("PROFİL") {
                    HStack {
                        Text("Müşteri No")
                        Spacer()
                        Text("C1001")
                    }
                    
                    HStack {
                        Text("İsim Soyisim")
                        Spacer()
                        Text("Rabia Yolcu")
                    }
                }
                
                Section("HESAPLAR") {
                    NavigationLink(destination: AccountDetailsView()) {
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Vadesiz Hesabım")
                                .fontWeight(.medium)
                            Text("TR100010203004004001")
                                .font(.caption)
                                .foregroundColor(.secondary)
                            Text("12500.75 TL")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        .padding(.vertical, 8)
                    }
                }

                
                Section("KARTLARIM") {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("ParaCard")
                            .fontWeight(.medium)
                        Text("6500 4321 8765 2109")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .navigationTitle("Ana Sayfa")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    ContentView()
}
