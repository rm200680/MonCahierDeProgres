//
//  Mon_cahier_de_progre_sApp.swift
//  Mon cahier de progrès
//
//  Created by Marine Rossi on 24/06/2026.
//

import SwiftUI
import SwiftData

@main
struct Mon_cahier_de_progre_sApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Student.self,
            Skill.self,
            Evaluation.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
