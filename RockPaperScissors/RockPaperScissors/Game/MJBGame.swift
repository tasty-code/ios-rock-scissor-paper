//
//  MJBGame.swift
//  RockPaperScissors
//
//  Created by Effie on 11/28/23.
//

import Foundation

struct MJBGame {
    private let leftPlayer: MJBPlayable
    
    private let rightPlayer: MJBPlayable
    
    private var turn: MJBPlayable
    
    private var other: MJBPlayable {
        return self.turn === leftPlayer ? rightPlayer : leftPlayer
    }
    
    private let display: PromptDisplayable & OuputDisplayble
    
    init(
        turn: MJBPlayable,
        other: MJBPlayable,
        displayOn display: PromptDisplayable & OuputDisplayble
    ) {
        self.turn = turn
        self.leftPlayer = self.turn
        self.rightPlayer = other
        self.display = display
    }
    
    // TODO: Playable 사용할 수 있도록 개선해보기
    private func getPlayerGestures() throws -> (MJBGesture, MJBGesture) {
        let turnDecision = turn.makeMJBDecision(currentTurn: self.turn)
        let otherDecision = other.makeMJBDecision(currentTurn: self.turn)
        
        if case MJBDecision.go(let turnGesture) = turnDecision,
           case MJBDecision.go(let otherGesture) = otherDecision {
            return (turnGesture, otherGesture)
        } else {
            throw RPSError.someoneWantsToExit
        }
    }
    
    private func displayResult(_ result: MJBResult) {
        [leftPlayer, rightPlayer].forEach { player in
            if let displayablePlayer = player as? MJBResultDisplayable {
                displayablePlayer.display(result: result)
            }
        }
    }
    
    private mutating func changeTurn(to nextTurn: MJBPlayable) {
        self.turn = nextTurn
    }
    
    mutating func start() throws {
        while true {
            let (turnGesture, otherGesture) = try getPlayerGestures()
            let result = MJBPart(turn: turnGesture, other: otherGesture).getResult()
            displayResult(result)
            switch result {
            case .win:
                return
            case .regame(let nextTurn):
                changeTurn(to: nextTurn)
                continue
            }
        }
    }
}
