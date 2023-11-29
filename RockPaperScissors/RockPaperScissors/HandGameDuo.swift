//
//  HandGameDuo.swift
//  RockPaperScissors
//
//  Created by Effie on 11/29/23.
//

import Foundation

struct HandGameDuo {
    let leftPlayer: HandGamePlayable
    let rightPlayer: HandGamePlayable
    
    func prepareMJBPlayers(rpsWinner: RPSPlayable) throws -> (winner: MJBPlayable, loser: MJBPlayable) {
        guard let rpsWinner = rpsWinner as? HandGamePlayable else {
            throw RPSError.typeError
        }
        
        if rpsWinner === leftPlayer {
            return (leftPlayer, rightPlayer)
        } else {
            return (rightPlayer, leftPlayer)
        }
    }
}
