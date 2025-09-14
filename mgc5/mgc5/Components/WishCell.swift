//
//  WishCell.swift
//  mgc5
//
//  Created by Rabia Yolcu on 13.09.2025.
//

import SwiftUI

// A reasuble cell view for displaying a wish item.
struct WishCell: View {
    
    // Properties
    
    var title: String
    
    //MARK: - Body
    
    var body: some View {
        Text(title)
            .modifier(TitleModifier())
    }
}
