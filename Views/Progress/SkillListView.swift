import SwiftUI

struct SkillListView: View {

    let student: Student
    let domainName: String

    private var skills: [String] {

        guard let domain = PSCatalog.domains.first(where: {
            $0.title == domainName
        }) else {
            return []
        }

        return domain.skills
    }

    var body: some View {

        List {

            ForEach(skills, id: \.self) { skill in

                NavigationLink {

                    EvaluationView(
                        student: student,
                        skillTitle: skill
                    )

                } label: {

                    HStack {

                        Image(systemName: "circle")
                            .foregroundStyle(.gray)

                        Text(skill)

                    }

                }

            }

        }
        .navigationTitle(domainName)
        .navigationBarTitleDisplayMode(.inline)

    }

}

#Preview {

    NavigationStack {

        SkillListView(
            student: Student(
                firstName: "Emma",
                lastName: "Martin",
                birthDate: .now
            ),
            domainName: "Apprendre ensemble et vivre ensemble"
        )

    }

}
