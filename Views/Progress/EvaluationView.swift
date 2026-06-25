import SwiftUI

struct EvaluationView: View {

    let student: Student
    let skillTitle: String

    @State private var status: SkillStatus = .notEvaluated

    var body: some View {

        Form {

            Section("Élève") {

                Text(student.fullName)
                    .font(.headline)

            }

            Section("Compétence") {

                Text(skillTitle)
                    .font(.body)

            }

            Section("Évaluation") {

                ForEach(SkillStatus.allCases, id: \.self) { state in

                    Button {

                        status = state

                    } label: {

                        HStack {

                            Text(state.symbol)
                                .font(.title2)

                            Text(state.title)

                            Spacer()

                            if status == state {

                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundStyle(.green)

                            }

                        }

                    }
                    .buttonStyle(.plain)

                }

            }

            Section("Résultat") {

                HStack {

                    Spacer()

                    Text(status.symbol)
                        .font(.system(size: 70))

                    Spacer()

                }

            }

        }
        .navigationTitle(student.firstName)
        .navigationBarTitleDisplayMode(.inline)

    }

}

#Preview {

    NavigationStack {

        EvaluationView(
            student: Student(
                firstName: "Emma",
                lastName: "Martin",
                birthDate: .now
            ),
            skillTitle: "Je dis mon prénom"
        )

    }

}
