//
//  lesson6_5App.swift
//  lesson6.5
//
//  Created by Javlonbek on 31/01/22.
//

import SwiftUI

@main
struct lesson6_5App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
