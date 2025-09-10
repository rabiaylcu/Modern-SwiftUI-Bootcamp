//
//  StockItem.swift
//  mgc3
//
//  Created by Rabia Yolcu on 28.08.2025.
//

import SwiftUI

struct StockItem: View {
    
    var stock: Stock
    
    init(stock: Stock) {
        self.stock = stock
    }
    
    var body: some View {
        HStack {
            Text(stock.symbol)
                .font(.headline)
                .foregroundStyle(Color.black)
            Spacer()
            
            Text(String(format: "%.2f$", stock.price))
                .foregroundStyle(Color.black)

            Text(String(format: "%.2f%%", stock.change))
                .foregroundColor(stock.change > 0 ? .green : .red)
        }
    }
}

#Preview {
    StockItem(
        stock: Stock(
            symbol: "AAPL",
            price: 190.0,
            change: 0.5
        )
    )
}
