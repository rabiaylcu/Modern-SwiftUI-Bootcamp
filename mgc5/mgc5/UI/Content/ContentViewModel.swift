//
//  ContentViewModel.swift
//  mgc5
//
//  Created by Rabia Yolcu on 13.09.2025.
//

import Foundation

class ContentViewModel : ObservableObject { //observable olması dinlenilebilmesini sağlıyor
    
    //MARK: - Properties
    
    // A list of all wishes
    @Published var wishes: [Wish] = []
    //Controls whether an alert should be displayed
    @Published var isAlertShowing: Bool = false
    // Hold wish content
    @Published var newWishText: String = ""
    
    // MARK: - Methods
    
    /// Add a new wish
    /// - Parameter text: The wish text entered by the user
    func addNewWish(_ text: String) {
        //Prevent adding empty wish
        guard text.isEmpty else { return }
        //Create new wish
        let wish = Wish(text: text)
        // Append it to the wish list
        wishes.append(wish)
        //Reset the wish text
        newWishText = ""
    }
    
    /// Removes an wish
    /// - Parameter vish: The wish object to remove
    func removeWish(with vish: Wish) {
        // Find the index of first wish in list
        if let index = wishes.firstIndex(of: vish) {
            // Remove it
            wishes.remove(at: index)
        }
    }
    
}
