//
//  RPSApp.swift
//  RockPaperScissors
//
//  Created by Effie on 11/28/23.
//

import Foundation

struct RPSApp {
    private let display: Displayable
    
    private let playerDuo: HandGameDuo
    
    init(display: IO, playerDuo: HandGameDuo) {
        self.display = display
        self.playerDuo = playerDuo
    }
    
    func run() {
        do {
            let rpsGame = RPSGame(between: playerDuo.leftPlayer, and: playerDuo.rightPlayer)
            let rpsWinner = try rpsGame.start()
            let mjbPlayers = try playerDuo.prepareMJBPlayers(rpsWinner: rpsWinner)
            var mjbGame = MJBGame(
                turn: mjbPlayers.winner,
                other: mjbPlayers.loser,
                displayOn: self.display
            )
            try mjbGame.start()
        } catch {
            if let rpsError = error as? RPSError {
                display.displayRPSError(rpsError)
            }
        }
    }
}
