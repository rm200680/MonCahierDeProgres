import Foundation
import SwiftData

@Model
final class Category {

    var title: String
    var order: Int

    init(
        title: String,
        order: Int
    ) {
        self.title = title
        self.order = order
    }

}
