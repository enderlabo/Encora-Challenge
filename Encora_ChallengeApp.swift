//
//  Encora_ChallengeApp.swift
//  Encora-Challenge
//
//  Created by Elderson Laborit on 21/05/24.
//

import SwiftUI

@main
struct Encora_ChallengeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
