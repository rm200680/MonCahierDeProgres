import SwiftUI

struct StatCard: View {

    let title: String
    let value: String
    let color: Color
    let icon: String

    var body: some View {

        VStack(spacing: 10) {

            Image(systemName: icon)
                .font(.title)

            Text(value)
                .font(.largeTitle.bold())

            Text(title)
                .font(.caption)

        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(color.opacity(0.15))
        .clipShape(RoundedRectangle(cornerRadius: 18))

    }

}

#Preview {

    StatCard(
        title: "Élèves",
        value: "24",
        color: .blue,
        icon: "person.3.fill"
    )

}
