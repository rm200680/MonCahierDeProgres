import SwiftUI

struct DomainListView: View {

    let student: Student

    let domains: [LearningDomain] = [

        LearningDomain(
            title: "Apprendre ensemble et vivre ensemble",
            icon: "heart.fill"
        ),

        LearningDomain(
            title: "Développement du langage oral",
            icon: "bubble.left.and.bubble.right.fill"
        ),

        LearningDomain(
            title: "Développement du langage écrit",
            icon: "character.book.closed.fill"
        ),

        LearningDomain(
            title: "Acquérir les premiers outils mathématiques",
            icon: "123.rectangle.fill"
        ),

        LearningDomain(
            title: "Explorer le monde",
            icon: "globe.europe.africa.fill"
        ),

        LearningDomain(
            title: "Activité physique",
            icon: "figure.run"
        ),

        LearningDomain(
            title: "Activités artistiques",
            icon: "paintpalette.fill"
        )

    ]

    var body: some View {

        List {

            ForEach(domains) { domain in

                NavigationLink {

                    SkillListView(
                        student: student,
                        domainName: domain.title
                    )

                } label: {

                    Label(domain.title,
                          systemImage: domain.icon)

                }

            }

        }
        .navigationTitle("Cahier de progrès")

    }

}

#Preview {

    DomainListView(
        student: Student(
            firstName: "Emma",
            lastName: "Martin",
            birthDate: .now
        )
    )

}
