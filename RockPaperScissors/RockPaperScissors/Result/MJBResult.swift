//
//  MJBResult.swift
//  RockPaperScissors
//
//  Created by Effie on 11/29/23.
//

import Foundation

enum MJBResult {
    case win(winner: MJBPlayable)
    case regame(nextTurn: MJBPlayable)
    
    var description: String {
        switch self {
        case .win(let winner):
            let winnerName = winner.getName()
            return "\(winnerName)의 승리!"
        case .regame(let nextTurn):
            let nextTurnName = nextTurn.getName()
            return "\(nextTurnName)의 턴입니다."
        }
    }
}
