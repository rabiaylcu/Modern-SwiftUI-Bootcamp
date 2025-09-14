//
//  TitleModifier.swift
//  mgc5
//
//  Created by Rabia Yolcu on 13.09.2025.
//

import SwiftUI

struct TitleModifier: ViewModifier {
     
    // MARK: - Body
    
    func body(content: Content) -> some View {
        content
        // Use a light calalout font style
            .font(.callout.weight(.bold))
        // Padding left
            .padding(.leading, 2.0)
    }
    
}
