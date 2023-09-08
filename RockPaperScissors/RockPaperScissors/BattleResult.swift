//
//  BattleResult.swift
//  RockPaperScissors
//
//  Created by JaeHyeok Sim on 2023/09/08.
//

import Foundation

enum BattleResult {
    case player1Win
    case player2Win
    case draw
    
    func getResultString() -> String {
        switch self {
        case .player1Win:
            return "이겼습니다!"
        case .player2Win:
            return "졌습니다!"
        case .draw:
            return "비겼습니다!"
        }
    }
}
