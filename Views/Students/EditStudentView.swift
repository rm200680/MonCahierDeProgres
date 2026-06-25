import SwiftUI

struct EditStudentView: View {

    @Environment(\.dismiss) private var dismiss

    @Bindable var student: Student

    var body: some View {

        NavigationStack {

            Form {

                Section("Identité") {
                    HStack {

                        Spacer()

                        StudentAvatarView(student: student)

                        Spacer()

                    }

                    PhotoPickerView(imageData: $student.photoData)
                    TextField("Prénom", text: $student.firstName)

                    TextField("Nom", text: $student.lastName)

                    DatePicker(
                        "Date de naissance",
                        selection: $student.birthDate,
                        displayedComponents: .date
                    )

                }

                Section("Notes") {

                    TextEditor(text: $student.notes)
                        .frame(minHeight: 120)

                }

            }

            .navigationTitle("Modifier")

            .toolbar {

                ToolbarItem(placement: .confirmationAction) {

                    Button("Terminé") {

                        dismiss()

                    }

                }

            }

        }

    }

}

#Preview {

    EditStudentView(
        student: Student(
            firstName: "Emma",
            lastName: "Martin",
            birthDate: .now
        )
    )

}
