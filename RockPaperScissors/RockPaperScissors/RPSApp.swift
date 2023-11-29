//
//  RPSApp.swift
//  RockPaperScissors
//
//  Created by Effie on 11/28/23.
//

import Foundation

struct RPSApp {
    private let io: IO
    
    private let playerDuo: HandGameDuo
    
    init(io: IO, playerDuo: HandGameDuo) {
        self.io = io
        self.playerDuo = playerDuo
    }
    
    func run() {
        do {
            let rpsGame = RPSIteration(between: playerDuo.leftPlayer, and: playerDuo.rightPlayer)
            let rpsWinner = try rpsGame.start()
            let mjbPlayers = try playerDuo.prepareMJBPlayers(rpsWinner: rpsWinner)
            var mjbGame = MJBIteration(turn: mjbPlayers.winner, other: mjbPlayers.loser, resultPrinter: self.io)
            try mjbGame.start()
        } catch {
            if let rpsError = error as? RPSError {
                io.printRPSError(rpsError)
            }
        }
    }
}
