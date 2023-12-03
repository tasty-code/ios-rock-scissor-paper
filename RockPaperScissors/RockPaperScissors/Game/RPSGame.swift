//
//  RPSGame.swift
//  RockPaperScissors
//
//  Created by Effie on 11/28/23.
//

struct RPSGame {
    private let leftPlayer: RPSPlayable
    
    private let rightPlayer: RPSPlayable
    
    init(between leftPlayer: RPSPlayable, and rightPlayer: RPSPlayable) { 
        self.leftPlayer = leftPlayer
        self.rightPlayer = rightPlayer
    }
    
    private func getPlayerGestures() throws -> (RPSHand, RPSHand) {
        let leftGesture = try leftPlayer.makeRPSGesture()
        let rightGesture = try rightPlayer.makeRPSGesture()
        return (leftGesture, rightGesture)
    }
    
    private func displayResult(_ result: RPSResult) {
        [leftPlayer, rightPlayer].forEach { player in
            if let displayablePlayer = player as? RPSResultDisplayable {
                displayablePlayer.display(result: result)
            }
        }
    }
    
    func start() throws -> (winner: RPSPlayable, loser: RPSPlayable) {
        while true {
            let (leftGesture, rightGesture) = try getPlayerGestures()
            let result = RPSPart(between: leftGesture, and: rightGesture).getResult()
            displayResult(result)
            switch result {
            case .win(let winner):
                let loser = winner === leftPlayer ? rightPlayer : leftPlayer
                return (winner, loser)
            case .draw:
                continue
            }
        }
    }
}
