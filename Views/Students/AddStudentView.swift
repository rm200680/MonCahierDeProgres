import SwiftUI
import SwiftData

struct AddStudentView: View {

    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context

    @State private var firstName = ""
    @State private var lastName = ""
    @State private var birthDate = Date()

    var body: some View {

        NavigationStack {

            Form {

                Section("Identité") {

                    TextField("Prénom", text: $firstName)

                    TextField("Nom", text: $lastName)

                    DatePicker(
                        "Date de naissance",
                        selection: $birthDate,
                        displayedComponents: .date
                    )

                }

            }

            .navigationTitle("Nouvel élève")

            .toolbar {

                ToolbarItem(placement: .cancellationAction) {

                    Button("Annuler") {
                        dismiss()
                    }

                }

                ToolbarItem(placement: .confirmationAction) {

                    Button("Enregistrer") {

                        let student = Student(
                            firstName: firstName,
                            lastName: lastName,
                            birthDate: birthDate
                        )

                        context.insert(student)

                        dismiss()

                    }
                    .disabled(firstName.isEmpty || lastName.isEmpty)

                }

            }

        }

    }

}

#Preview {

    AddStudentView()

}
