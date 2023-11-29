//
//  GameResult.swift
//  RockPaperScissors
//
//  Created by Minho on 11/28/23.
//

enum GameResult: CustomStringConvertible {
    case win, draw, lose, rematch
    
    var description: String {
        switch self {
        case .win:
            return "이겼습니다!"
        case .draw:
            return "비겼습니다!"
        case .lose:
            return "졌습니다!"
        case .rematch:
            return "재매치" // MARK: 다른 처리 방안 고려 (사용하지 않는 메시지)
        }
    }
}
