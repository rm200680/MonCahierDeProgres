import SwiftUI

struct SkillListView: View {

    let student: Student
    let domainName: String

    var skills: [CatalogSkill] {

        PSCatalog.skills.filter {

            $0.domain == domainName

        }

    }

    var body: some View {

        List {

            ForEach(skills) { skill in

                NavigationLink {

                    EvaluationView(
                        student: student,
                        skillTitle: skill.title
                    )

                } label: {

                    VStack(alignment: .leading, spacing: 6) {

                        Text(skill.title)
                            .font(.headline)

                        Text(skill.category)
                            .font(.caption)
                            .foregroundStyle(.secondary)

                    }

                }

            }

        }

        .navigationTitle(domainName)

    }

}

#Preview {

    SkillListView(
        student: Student(
            firstName: "Emma",
            lastName: "Martin",
            birthDate: .now
        ),
        domainName: "Apprendre ensemble et vivre ensemble"
    )

}
