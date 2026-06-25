import SwiftUI

struct StudentAvatarView: View {

    let student: Student

    var body: some View {

        Group {

            if let data = student.photoData,
               let image = UIImage(data: data) {

                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()

            } else {

                Image(systemName: "person.crop.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.blue.opacity(0.8))

            }

        }
        .frame(width: 60, height: 60)
        .clipShape(Circle())

    }

}

#Preview {

    StudentAvatarView(
        student: Student(
            firstName: "Emma",
            lastName: "Martin",
            birthDate: .now
        )
    )

}
