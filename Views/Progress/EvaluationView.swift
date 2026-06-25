import SwiftUI

struct EvaluationView: View {

    let student: Student
    let skillTitle: String

    @State private var status: SkillStatus = .notEvaluated

    var body: some View {

        Form {

            Section {

                Text(skillTitle)
                    .font(.headline)

            }

            Section("Évaluation") {

                Picker(
                    "Niveau",
                    selection: $status
                ) {

                    ForEach(
                        SkillStatus.allCases,
                        id: \.self
                    ) { state in

                        Text(
                            "\(state.symbol) \(state.title)"
                        )
                        .tag(state)

                    }

                }

                .pickerStyle(.inline)

            }

        }

        .navigationTitle(student.firstName)

    }

}

#Preview {

    EvaluationView(
        student: Student(
            firstName: "Emma",
            lastName: "Martin",
            birthDate: .now
        ),
        skillTitle: "Je dis mon prénom"
    )

}
