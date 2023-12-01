//
//  Result.swift
//  RockPaperScissors
//
//  Created by mireu & kyle.
//

enum GameResult {
    case win
    case lose
    case draw
    
    var message: String {
        switch self {
        case .win:
            "이겼습니다!"
        case .lose:
            "졌습니다!"
        case .draw:
            "비겼습니다!"
        }
    }
}
