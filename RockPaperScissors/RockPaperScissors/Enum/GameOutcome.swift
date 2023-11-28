import Foundation

enum GameOutcome: CustomStringConvertible {
    case draw, win, loss
    
    var description: String {
        switch self {
        case .draw:
            return "비겼습니다!"
        case .win:
            return "이겼습니다!"
        case .loss:
            return "졌습니다!"
        }
    }
}

