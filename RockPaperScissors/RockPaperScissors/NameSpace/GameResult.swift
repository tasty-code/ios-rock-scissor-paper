//
//  Result.swift
//  RockPaperScissors
//
//  Created by mireu & kyle.
//

enum GameResult {
    case draw
    case win
    case lose
}

extension GameResult {
    var message: String {
        switch self {
        case .draw:
            "비겼습니다!"
        case .win:
            "이겼습니다!"
        case .lose:
            "졌습니다!"
        }
    }
}
