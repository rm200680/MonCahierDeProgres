import Foundation
import SwiftData

enum CatalogLoader {

    static func loadIfNeeded(context: ModelContext) {

        let descriptor = FetchDescriptor<Skill>()

        guard let count = try? context.fetchCount(descriptor),
              count == 0 else {
            return
        }

        //--------------------------------------------------
        // Domaine
        //--------------------------------------------------

        let vivreEnsemble = Domain(
            title: "Apprendre ensemble et vivre ensemble",
            icon: "person.3.fill",
            order: 0
        )

        context.insert(vivreEnsemble)

        //--------------------------------------------------
        // Catégorie
        //--------------------------------------------------

        let comportement = Category(
            title: "Comportement",
            order: 0
        )

        context.insert(comportement)

        //--------------------------------------------------
        // Compétences
        //--------------------------------------------------

        let skills = [

            "J’accepte de me séparer de l’adulte sans pleurer",

            "J’écoute en silence quand quelqu’un parle",

            "J’accepte de participer aux regroupements",

            "Je respecte le signal sonore pour ranger la classe",

            "Je viens me regrouper avec mes camarades"

        ]

        for (index,title) in skills.enumerated() {

            let skill = Skill(
                title: title,
                order: index,
                category: comportement
            )

            context.insert(skill)

        }

        try? context.save()

    }

}
