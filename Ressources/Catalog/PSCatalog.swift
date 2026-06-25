import Foundation

struct CatalogSkill: Identifiable {

    let id = UUID()
    let title: String
    let domain: String
    let category: String

}

struct PSCatalog {

    static let skills: [CatalogSkill] = [

        CatalogSkill(
            title: "J’accepte de me séparer de l’adulte sans pleurer",
            domain: "Apprendre ensemble et vivre ensemble",
            category: "Comportement"
        ),

        CatalogSkill(
            title: "J’écoute en silence quand quelqu’un parle",
            domain: "Apprendre ensemble et vivre ensemble",
            category: "Comportement"
        ),

        CatalogSkill(
            title: "J’accepte de participer aux regroupements",
            domain: "Apprendre ensemble et vivre ensemble",
            category: "Comportement"
        ),

        CatalogSkill(
            title: "Je respecte le signal sonore pour ranger la classe",
            domain: "Apprendre ensemble et vivre ensemble",
            category: "Comportement"
        ),

        CatalogSkill(
            title: "Je viens me regrouper avec mes camarades",
            domain: "Apprendre ensemble et vivre ensemble",
            category: "Comportement"
        )

    ]

}
