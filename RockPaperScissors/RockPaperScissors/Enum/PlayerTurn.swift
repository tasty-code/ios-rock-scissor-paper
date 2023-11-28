import Foundation

enum PlayerTurn: CustomStringConvertible {
    case user, computer, none
    
    var description: String {
        
        switch self {
        case .user:
            return "사용자"
        case .computer:
            return "컴퓨터"
        case .none:
            return "none"
        }
    }
}
