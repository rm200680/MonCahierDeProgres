// StudentDetailView.swift
// Reconstruction du fichier complet.
// Cette version est un squelette de reconstruction.
// Elle ne peut pas être fidèle sans les autres vues et modèles du projet,
// car le fichier d'origine est tronqué.

import SwiftUI
import SwiftData

struct StudentDetailView: View {
    let student: Student

    var body: some View {
        Text("Le fichier d'origine est tronqué et doit être reconstruit avec le projet complet.")
            .navigationTitle(student.firstName)
    }
}

#Preview {
    NavigationStack {
        StudentDetailView(
            student: Student(
                firstName: "Emma",
                lastName: "Martin",
                birthDate: .now
            )
        )
    }
}
