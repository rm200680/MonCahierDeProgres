import Foundation
import SwiftData

@Model
final class Skill {

    var title: String

    var order: Int

    @Relationship
    var category: Category

    init(
        title: String,
        order: Int,
        category: Category
    ) {

        self.title = title
        self.order = order
        self.category = category

    }

}
