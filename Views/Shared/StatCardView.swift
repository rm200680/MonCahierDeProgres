import SwiftUI
import SwiftData

struct StatCardView: View {

    @Environment(\.modelContext) private var context

    let student: Student

    @State private var acquired = 0
    @State private var inProgress = 0
    @State private var notAcquired = 0

    private var total: Int {
        acquired + inProgress + notAcquired
    }

    private var percent: Int {

        guard total > 0 else { return 0 }

        return Int((Double(acquired) / Double(total)) * 100)

    }

    var body: some View {

        VStack(alignment: .leading, spacing: 16) {

            Text("Progression")
                .font(.headline)

            HStack {

                statColumn(
                    value: acquired,
                    title: "Acquis",
                    color: .green
                )

                Spacer()

                statColumn(
                    value: inProgress,
                    title: "En cours",
                    color: .orange
                )

                Spacer()

                statColumn(
                    value: notAcquired,
                    title: "Non acquis",
                    color: .red
                )

            }

            ProgressView(
                value: Double(acquired),
                total: Double(max(total, 1))
            )
            .tint(.green)

            Text("\(percent) % de compétences acquises")
                .font(.caption)
                .foregroundStyle(.secondary)

        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 18))
        .task {

            loadStatistics()

        }

    }

    @ViewBuilder
    private func statColumn(
        value: Int,
        title: String,
        color: Color
    ) -> some View {

        VStack {

            Text("\(value)")
                .font(.title.bold())
                .foregroundStyle(color)

            Text(title)
                .font(.caption)

        }

    }

    private func loadStatistics() {

        do {

            let descriptor = FetchDescriptor<Evaluation>()

            let evaluations = try context.fetch(descriptor)

            let mine = evaluations.filter {

                $0.student.persistentModelID ==
                student.persistentModelID

            }

            acquired = mine.filter {
                $0.status == .acquired
            }.count

            inProgress = mine.filter {
                $0.status == .inProgress
            }.count

            notAcquired = mine.filter {
                $0.status == .notAcquired
            }.count

        } catch {

            print(error)

        }

    }

}

#Preview {

    StatCardView(
        student: Student(
            firstName: "Emma",
            lastName: "Martin",
            birthDate: .now
        )
    )

}
