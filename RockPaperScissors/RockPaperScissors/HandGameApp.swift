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
            let rpsWinner = try rpsGame.start()
            let mjbPlayers = try playerDuo.prepareMJBPlayers(rpsWinner: rpsWinner)
            var mjbGame = MJBGame(
                turn: mjbPlayers.winner,
                other: mjbPlayers.loser
            )
            try mjbGame.start()
        } catch {
            if let rpsError = error as? HandGameError {
                errorDisplay.displayRPSError(rpsError)
            }
        }
    }
}
