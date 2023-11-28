//
//  RPSGameIteration.swift
//  RockPaperScissors
//
//  Created by Effie on 11/28/23.
//

import Foundation

enum RPSResult {
    case win(Playable)
    case draw
}

struct RPSPart {
    private let leftGesture: Gesture
    
    private let rightGesture: Gesture
    
    init(between leftGesture: Gesture, and rightGesture: Gesture) {
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
    private let leftPlayer: Playable
    
    private let rightPlayer: Playable
    
    init(between leftPlayer: Playable, and rightPlayer: Playable) { 
        self.leftPlayer = leftPlayer
        self.rightPlayer = rightPlayer
    }
    
    // TODO: Playable 사용할 수 있도록 개선해보기
    private func getPlayerGestures() throws -> (Gesture, Gesture) {
        let leftDecision = leftPlayer.makeDecision()
        let rightDecision = rightPlayer.makeDecision()
        if case PlayerDecision.go(let leftGesture) = leftDecision,
           case PlayerDecision.go(let rightGesture) = rightDecision {
            return (leftGesture, rightGesture)
        } else {
            throw RPSError.someoneWantsToExit
        }
    }
    
    private func printResult(_ result: RPSResult) {
        [leftPlayer, rightPlayer].forEach { player in
            if let printablePlayer = player as? GameResultPrintable {
                printablePlayer.print(result: result)
            }
        }
    }
    
    func start() throws -> Playable {
        while true {
            let (leftGesture, rightGesture) = try getPlayerGestures()
            let result = RPSPart(between: leftGesture, and: rightGesture).getResult()
            printResult(result)
            switch result {
            case .win(let winner):
                return winner
            case .draw:
                continue
            }
        }
    }
}
