import SwiftUI

struct StudentRowView: View {

    let student: Student

    var body: some View {

        HStack(spacing: 15) {

            StudentAvatarView(student: student)

            VStack(alignment: .leading) {

                Text(student.fullName)
                    .font(.headline)

                Text("\(student.age) ans")
                    .foregroundStyle(.secondary)

            }

            Spacer()

        }
        .padding(.vertical, 4)

    }

}

#Preview {

    StudentRowView(
        student: Student(
            firstName: "Emma",
            lastName: "Martin",
            birthDate: .now
        )
    )

}
