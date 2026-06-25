import Foundation
import SwiftData

@Model
final class Level {

    var name: String
    var order: Int

    @Relationship(deleteRule: .cascade)
    var domains: [Domain]

    init(
        name: String,
        order: Int
    ) {
        self.name = name
        self.order = order
        self.domains = []
    }

}
