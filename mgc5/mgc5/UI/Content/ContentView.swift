//
//  ContentView.swift
//  mgc5
//
//  Created by Rabia Yolcu on 13.09.2025.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    @StateObject var viewModel = ContentViewModel()
    
    // MARK: - Body
    
    var body: some View {
        NavigationStack {
            // Main list of wishes
            List(viewModel.wishes) { wish in
                WishCell(title: wish.text)
                    .swipeActions(edge: .trailing) {
                        deleteButton(wish)
                    } //: Delete Button
            } //: List
            .navigationTitle(Localizations.ContentView.title)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    addButton()
                }
                
                ToolbarItem(placement: .bottomBar){
                    bottomInfoView()
                }
                
            } //: toolbar
        } //:NavigationStack
        .alert(Localizations.ContentView.alertTitle, isPresented: $viewModel.isAlertShowing){
            alertView()
        }
        .overlay {
            noContentView()
        } //: Overlay
    } //: Body
}


//MARK: Preview
#Preview {
    ContentView()
}

extension ContentView {
    
    @ViewBuilder
    func addButton(_ wish: Wish) -> some View {
        Button {
            viewModel.isAlertShowing.toggle()
        } label: {
            Image.ContentView.addWish
        }
    }
    
    @ViewBuilder
    func deleteButton(_ wish: Wish) -> some View {
        Button(Localizations.Common.delete, role: .destructive) {
            viewModel.removeWish(with: wish)
        } //: Button
    }
    
    @ViewBuilder
    func bottomInfoView() -> some View {
        if !viewModel.wishes.isEmpty {
            Text("\(viewModel.wishes.count) \(viewModel.wishes.count > 1 ? "wishes" : "wish")")


        }
    }
    
    @ViewBuilder
    func alertView() -> some View {
        TextField(Localizations.ContentView.alertTextFieldPlaceholder, text: $viewModel.newWishText)
        
        Button(Localizations.Common.add) {
            viewModel.addWish(viewModel.newWishText)
        }
    }
    
    @ViewBuilder
    func noContentView() -> some View {
        if viewModel.wishes.isEmpty {
            ContentUnavailableView(
                "My Wishes",
                systemImage: "heart.circle",
                description: Text("No wishes yet. Add one to get started.")
            )//ContentUnavailableView
        }
    }
    
}
