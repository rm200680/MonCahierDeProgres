import Foundation
import SwiftData

@Model
final class Evaluation {

    var status: SkillStatus
    var date: Date
    var comment: String

    @Relationship
    var student: Student

    @Relationship
    var skill: Skill

    init(
        student: Student,
        skill: Skill,
        status: SkillStatus = .notEvaluated,
        date: Date = .now,
        comment: String = ""
    ) {
        self.student = student
        self.skill = skill
        self.status = status
        self.date = date
        self.comment = comment
    }

}
