import Foundation
import SwiftData

@Model
final class Domain {

    var title: String
    var icon: String
    var order: Int

    @Relationship(deleteRule: .cascade)
    var skills: [Skill]

    init(
        title: String,
        icon: String,
        order: Int
    ) {

        self.title = title
        self.icon = icon
        self.order = order
        self.skills = []

    }

}
