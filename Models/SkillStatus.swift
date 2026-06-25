import Foundation

enum SkillStatus: Int, Codable, CaseIterable {

    case notEvaluated
    case notAcquired
    case inProgress
    case acquired

    var title: String {

        switch self {

        case .notEvaluated:
            return "Non évalué"

        case .notAcquired:
            return "Non acquis"

        case .inProgress:
            return "En cours"

        case .acquired:
            return "Acquis"

        }

    }

    var symbol: String {

        switch self {

        case .notEvaluated:
            return "⚪️"

        case .notAcquired:
            return "🔴"

        case .inProgress:
            return "🟠"

        case .acquired:
            return "🟢"

        }

    }

}
