//
//  MJBResult.swift
//  RockPaperScissors
//
//  Created by Effie on 11/29/23.
//

enum MJBResult {
    case win(winner: MJBPlayable)
    case regame(nextTurn: MJBPlayable)
    
    var description: String {
        switch self {
        case .win(let winner):
            let winnerName = winner.name
            return "\(winnerName)의 승리!"
        case .regame(let nextTurn):
            let nextTurnName = nextTurn.name
            return "\(nextTurnName)의 턴입니다."
        }
    }
}
