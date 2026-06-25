import SwiftUI
import SwiftData

@main
struct Mon_cahier_de_progre_sApp: App {

    var sharedModelContainer: ModelContainer = {

        let schema = Schema([

            Student.self,
            Domain.self,
            Category.self,
            Skill.self,
            Evaluation.self

        ])

        let configuration = ModelConfiguration(
            schema: schema,
            isStoredInMemoryOnly: false
        )

        do {

            return try ModelContainer(
                for: schema,
                configurations: [configuration]
            )

        } catch {

            fatalError("Erreur SwiftData : \(error)")

        }

    }()

    var body: some Scene {

        WindowGroup {

            ContentView()

        }
        .modelContainer(sharedModelContainer)

    }

}
