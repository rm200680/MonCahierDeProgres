import Foundation
import SwiftData

@Model
final class Student {
    var id = UUID()
    var firstName: String
    var lastName: String
    var birthDate: Date
    var notes: String
    var photoData: Data?
    init(
        firstName: String,
        lastName: String,
        birthDate: Date,
        notes: String = "",
        photoData: Data? = nil
    ) {
        self.firstName = firstName
        self.lastName = lastName
        self.birthDate = birthDate
        self.notes = notes
        self.photoData = photoData
    }

    var fullName: String {
        "\(firstName) \(lastName)"
    }

    var age: Int {
        Calendar.current.dateComponents(
            [.year],
            from: birthDate,
            to: Date()
        ).year ?? 0
    }
}
