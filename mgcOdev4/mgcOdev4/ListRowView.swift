//
//  ListRowView.swift
//  mgcOdev4
//
//  Created by Rabia Yolcu on 10.09.2025.
//

import SwiftUI

struct ListRowView: View {
    let item: ListItem
    
    var body: some View {
        HStack {
            Image(systemName: item.symbolName)
                .foregroundColor(item.isCompleted ? .green : .blue)
                .font(.title2)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(item.title)
                    .font(.headline)
                    .strikethrough(item.isCompleted)
                
                Text(item.description)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }
            
            Spacer()
            
            if item.isCompleted {
                Image(systemName: "checkmark.circle.fill")
                    .foregroundColor(.green)
            }
        }
        .padding(.vertical, 2)
    }
}

