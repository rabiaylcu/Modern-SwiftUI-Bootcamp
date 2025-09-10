//
//  OrderView.swift
//  mgc3
//
//  Created by Rabia Yolcu on 28.08.2025.
//

import SwiftUI

struct OrderView: View {
    
    @State var amount: Int = 1
    
    var stock: Stock
    
    init(stock: Stock) {
        self.stock = stock
    }
    
    var body: some View {
        Form {
            
            Section("Stock Info") {
                HStack {
                    Text(stock.symbol)
                    Spacer()
                    Text(String(format: "%.2f$", stock.price))
                        .foregroundStyle(Color.black)
                }
            }
            
            Section("Adet") {
                Stepper(value: $amount) {
                    Text("Adet: \(amount)")
                }
            }
            
            Section("Toplam Tutar") {
                Text(String(format: "%.2f$", Double(amount) * stock.price))
            }
        }
    }
}

#Preview {
    OrderView(
        stock: Stock(
            symbol: "TSLA",
            price: 250.0,
            change: -0.3
        )
    )
}
