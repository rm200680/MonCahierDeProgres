import SwiftUI

struct DashboardCard: View {

    let title: String
    let subtitle: String
    let icon: String
    let color: Color

    var body: some View {

        HStack {

            Image(systemName: icon)
                .font(.system(size: 30))
                .foregroundStyle(.white)
                .frame(width: 60, height: 60)
                .background(color)
                .clipShape(RoundedRectangle(cornerRadius: 16))

            VStack(alignment: .leading) {

                Text(title)
                    .font(.headline)

                Text(subtitle)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)

            }

            Spacer()

            Image(systemName: "chevron.right")
                .foregroundStyle(.secondary)

        }
        .padding()
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 18))
        .shadow(radius: 3)

    }

}

#Preview {
    DashboardCard(
        title: "Mes élèves",
        subtitle: "Gérer les élèves",
        icon: "person.3.fill",
        color: .blue
    )
}
