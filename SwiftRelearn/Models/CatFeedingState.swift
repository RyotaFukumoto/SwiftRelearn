// CatFeedingState.swift

import Foundation

enum FeedingState {
    case hungry
    case fed

    var description: String {
        switch self {
        case .hungry: return "お腹が空いています。"
        case .fed: return "ごはんを食べました！"
        }
    }

    var buttonLabel: String {
        switch self {
        case .hungry: return "ごはんをあげる"
        case .fed: return "おかわり"
        }
    }
}
