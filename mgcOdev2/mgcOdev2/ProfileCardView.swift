//
//  ProfileCardView.swift
//  mgcOdev2
//
//  Created by Rabia Yolcu on 28.08.2025.
//

import SwiftUI

struct ProfileCardView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                ZStack {
                    LinearGradient(
                        gradient: Gradient(colors: [Color.gray.opacity(0.3), Color.black.opacity(0.9)]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    .frame(height: 250)
                    
                    VStack(spacing: 10) {
                        Image(systemName: "person.circle.fill")
                            .font(.system(size: 80))
                            .foregroundColor(.white)
                            .clipShape(Circle())
                        
                        Text("Rabia Yolcu")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Text("IOS Developer")
                            .font(.subheadline)
                            .foregroundColor(.white)
                    }
                }
                
                VStack(spacing: 20) {
                    // Bilgi Kartları (HStack kullanımı)
                    HStack(spacing: 20) {
                        VStack {
                            Text("493")
                                .font(.title3)
                                .fontWeight(.bold)
                            Text("Takipçi")
                                .font(.caption)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.gray.opacity(0.6))
                        .cornerRadius(10)
                        
                        VStack {
                            Text("367")
                                .font(.title3)
                                .fontWeight(.bold)
                            Text("Takip Edilen")
                                .font(.caption)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.gray.opacity(0.6))
                        .cornerRadius(10)
                        
                        VStack {
                            Text("123")
                                .font(.title3)
                                .fontWeight(.bold)
                            Text("Beğeni")
                                .font(.caption)
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.gray.opacity(0.6))
                        .cornerRadius(10)
                    }
                    .padding(.horizontal)
                    
                    // Hakkımda (About Me)
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Hakkımda")
                            .font(.title3)
                            .fontWeight(.bold)
                        
                        Text("Merhaba! Ben 1 yıllık deneyime sahip bir IOS geliştiricisiyim. SwiftUI ve UIKit konularında yeniyim. Kullanıcı dostu arayüzler tasarlamayı seviyorum.")
                            .font(.body)
                            .lineSpacing(4)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    
                    // Buton Alanı
                    HStack(spacing: 15) {
                        Button("Mesaj Gönder") {
                            // Mesaj gönder
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        
                        Button("Takip Et") {
                            // Takip et
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    .padding(.horizontal)
                }
                .padding(.top, 20)
            }
        }
    }
}

#Preview {
    ProfileCardView()
}
