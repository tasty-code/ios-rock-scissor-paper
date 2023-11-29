//
//  RPSGameIteration.swift
//  RockPaperScissors
//
//  Created by Effie on 11/28/23.
//

import Foundation

enum RPSResult {
    case win(RPSPlayable)
    case draw
}

struct RPSPart {
    private let leftGesture: RPSGesture
    
    private let rightGesture: RPSGesture
    
    init(between leftGesture: RPSGesture, and rightGesture: RPSGesture) {
        self.leftGesture = leftGesture
        self.rightGesture = rightGesture
    }
    
    func getResult() -> RPSResult {
        let leftHand = leftGesture.hand
        let rightHand = rightGesture.hand
        
        if leftHand == rightHand {
            return .draw
        } else {
            let winningGesture = leftHand.wins(rightHand) ? leftGesture : rightGesture
            let winner = winningGesture.owner
            return .win(winner)
        }
    }
}

struct RPSIteration {
    private let leftPlayer: RPSPlayable
    
    private let rightPlayer: RPSPlayable
    
    init(between leftPlayer: RPSPlayable, and rightPlayer: RPSPlayable) { 
        self.leftPlayer = leftPlayer
        self.rightPlayer = rightPlayer
    }
    
    // TODO: Playable 사용할 수 있도록 개선해보기
    private func getPlayerGestures() throws -> (RPSGesture, RPSGesture) {
        let leftDecision = leftPlayer.makeRPSDecision()
        let rightDecision = rightPlayer.makeRPSDecision()
        if case RPSDecision.go(let leftGesture) = leftDecision,
           case RPSDecision.go(let rightGesture) = rightDecision {
            return (leftGesture, rightGesture)
        } else {
            throw RPSError.someoneWantsToExit
        }
    }
    
    private func displayResult(_ result: RPSResult) {
        [leftPlayer, rightPlayer].forEach { player in
            if let displayablePlayer = player as? RPSResultDisplayable {
                displayablePlayer.display(result: result)
            }
        }
    }
    
    func start() throws -> RPSPlayable {
        while true {
            let (leftGesture, rightGesture) = try getPlayerGestures()
            let result = RPSPart(between: leftGesture, and: rightGesture).getResult()
            displayResult(result)
            switch result {
            case .win(let winner):
                return winner
            case .draw:
                continue
            }
        }
    }
}
