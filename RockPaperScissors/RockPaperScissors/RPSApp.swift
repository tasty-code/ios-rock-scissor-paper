//
//  RPSApp.swift
//  RockPaperScissors
//
//  Created by Effie on 11/28/23.
//

import Foundation

typealias HandGameDuo = (Playable, Playable)

struct RPSApp {
    private let io: IO
    
    private let (leftPlayer, rightPlayer): HandGameDuo
    
    init(io: IO, playerDuo: HandGameDuo) {
        self.io = io
        (self.leftPlayer, self.rightPlayer) = playerDuo
    }
    
    func run() {
        do {
            let game = RPSIteration(between: leftPlayer, and: rightPlayer)
            let rspGameWinner = try game.start()
        } catch {
            if let rpsError = error as? RPSError {
                io.printRPSError(rpsError)
            }
        }
    }
}
