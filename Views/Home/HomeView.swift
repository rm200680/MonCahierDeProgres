import SwiftUI
import SwiftData

struct HomeView: View {

    @Query(sort: [
        SortDescriptor(\Student.lastName),
        SortDescriptor(\Student.firstName)
    ])
    private var students: [Student]

    var body: some View {

        NavigationStack {

            ScrollView {

                VStack(alignment: .leading, spacing: 24) {

                    VStack(alignment: .leading) {

                        Text("📚 Mon Cahier de Progrès")
                            .font(.largeTitle.bold())

                        Text("Bonjour Marine 👋")
                            .font(.title3)
                            .foregroundStyle(.secondary)

                    }

                    HStack {

                        StatCard(
                            title: "Élèves",
                            value: "\(students.count)",
                            color: .blue,
                            icon: "person.3.fill"
                        )

                        StatCard(
                            title: "Acquis",
                            value: "--",
                            color: .green,
                            icon: "checkmark.circle.fill"
                        )

                    }

                    NavigationLink {

                        StudentListView()

                    } label: {

                        DashboardCard(
                            title: "Mes élèves",
                            subtitle: "Gérer les élèves",
                            icon: "person.3.fill",
                            color: .blue
                        )

                    }
                    .buttonStyle(.plain)

                    DashboardCard(
                        title: "Évaluation rapide",
                        subtitle: "Bientôt disponible",
                        icon: "bolt.fill",
                        color: .orange
                    )

                    DashboardCard(
                        title: "Livrets PDF",
                        subtitle: "Bientôt disponible",
                        icon: "doc.richtext.fill",
                        color: .purple
                    )

                }
                .padding()

            }

        }

    }

}

#Preview {
    HomeView()
}
