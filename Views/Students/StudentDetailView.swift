import SwiftUI

struct StudentDetailView: View {

    let student: Student

    var body: some View {

        Form {
            Section("Suivi") {

                NavigationLink {

                    DomainListView(student: student)

                } label: {

                    Label(
                        "Cahier de progrès",
                        systemImage: "book.closed.fill"
                    )

                }

            }
            Section {

                Image(systemName: "person.crop.circle.fill")
                    .font(.system(size: 100))
                    .foregroundStyle(.blue)
                    .frame(maxWidth: .infinity)

                Text(student.fullName)
                    .font(.title2.bold())
                    .frame(maxWidth: .infinity)

            }

            Section("Informations") {

                LabeledContent("Prénom", value: student.firstName)

                LabeledContent("Nom", value: student.lastName)

                LabeledContent(
                    "Naissance",
                    value: student.birthDate.formatted(date: .long, time: .omitted)
                )

                LabeledContent(
                    "Âge",
                    value: "\(student.age) ans"
                )

            }

            Section("Notes") {

                if student.notes.isEmpty {

                    Text("Aucune note")

                } else {

                    Text(student.notes)

                }

            }

        }
        .navigationTitle(student.firstName)
        .toolbar {

            NavigationLink {

                EditStudentView(student: student)

            } label: {

                Image(systemName: "pencil")

            }

        }
    }

}

#Preview {

    StudentDetailView(
        student: Student(
            firstName: "Emma",
            lastName: "Martin",
            birthDate: .now
        )
    )

}
