//
//  SwiftWeatherAppApp.swift
//  SwiftWeatherApp
//
//  Created by Aalok Barma on 21/09/23.
//

import SwiftUI

@main
struct SwiftWeatherAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
