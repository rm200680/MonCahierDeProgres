import Foundation
import SwiftData

struct EvaluationService {

    static func evaluation(
        for student: Student,
        skill: Skill,
        in context: ModelContext
    ) throws -> Evaluation {

        let descriptor = FetchDescriptor<Evaluation>()

        let evaluations = try context.fetch(descriptor)

        if let existing = evaluations.first(where: {

            $0.student.id == student.id &&
            $0.skill.id == skill.id

        }) {

            return existing

        }

        let evaluation = Evaluation(
            student: student,
            skill: skill
        )

        context.insert(evaluation)

        return evaluation

    }

}
