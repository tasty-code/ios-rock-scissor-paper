//
//  Result.swift
//  RockPaperScissors
//
//  Created by mireu & kyle.
//

enum GameResult {
    static let draw = "비겼습니다!"
    static let win = "이겼습니다!"
    static let lose = "졌습니다!"
}

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
