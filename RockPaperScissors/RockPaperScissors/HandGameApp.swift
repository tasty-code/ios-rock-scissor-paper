//
//  HandGameApp.swift
//  RockPaperScissors
//
//  Created by Effie on 11/28/23.
//

import Foundation

struct HandGameApp {
    private let errorDisplay: HandGameErrorDisplayble
    
    private let playerDuo: HandGameDuo
    
    init(playerDuo: HandGameDuo, errorDisplay: HandGameErrorDisplayble) {
        self.playerDuo = playerDuo
        self.errorDisplay = errorDisplay
    }
    
    func run() {
        do {
            let rpsGame = RPSGame(between: playerDuo.leftPlayer, and: playerDuo.rightPlayer)
            let (rpsWinner, rpsLoser) = try rpsGame.start()
            guard let turn = rpsWinner as? MJBPlayable,
                  let other = rpsLoser as? MJBPlayable else {
                return
            }
            var mjbGame = MJBGame(turn: turn, other: other)
            try mjbGame.start()
        } catch HandGameError.someoneWantsToExit {
            errorDisplay.displayRPSError(HandGameError.someoneWantsToExit)
        } catch { return }
    }
}
