//
//  mgcOdev8App.swift
//  mgcOdev8
//
//  Created by Rabia Yolcu on 14.09.2025.
//

import SwiftUI

@main
struct mgcOdev8App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
