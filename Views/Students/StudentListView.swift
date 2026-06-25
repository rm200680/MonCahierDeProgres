import SwiftUI
import SwiftData

struct StudentListView: View {

    @Environment(\.modelContext) private var context

    @Query(sort: [
        SortDescriptor(\Student.lastName),
        SortDescriptor(\Student.firstName)
    ])
    private var students: [Student]

    @State private var showingAddStudent = false
    @State private var searchText = ""

    var filteredStudents: [Student] {

        if searchText.isEmpty {
            return students
        }

        return students.filter {

            $0.fullName.localizedCaseInsensitiveContains(searchText)

        }

    }

    var body: some View {

        Group {

            if filteredStudents.isEmpty {

                ContentUnavailableView(
                    "Aucun élève",
                    systemImage: "person.3",
                    description: Text("Touchez + pour ajouter un élève.")
                )

            } else {

                List {

                    ForEach(filteredStudents) { student in

                        NavigationLink {

                            StudentDetailView(student: student)

                        } label: {

                            StudentRowView(student: student)

                        }

                    }
                    .onDelete(perform: deleteStudents)

                }

            }

        }
        .navigationTitle("Mes élèves")

        .searchable(text: $searchText,
                    prompt: "Rechercher un élève")

        .toolbar {

            ToolbarItem(placement: .topBarTrailing) {

                Button {

                    showingAddStudent = true

                } label: {

                    Image(systemName: "plus")

                }

            }

        }

        .sheet(isPresented: $showingAddStudent) {

            AddStudentView()

        }

    }

    private func deleteStudents(at offsets: IndexSet) {

        for index in offsets {

            let student = filteredStudents[index]
            context.delete(student)

        }

    }

}

#Preview {

    StudentListView()

}
