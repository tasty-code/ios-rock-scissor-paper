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
        get {
            return self.turn === leftPlayer ? rightPlayer : leftPlayer
        }
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
    
#warning("displaying 으로 로직 이동시키기")
    private func displayTrun() {
        let turnName = turn.displayResult()
        display.displayPrompt("[\(turnName) 턴]")
    }
    
    // TODO: Playable 사용할 수 있도록 개선해보기
    private func getPlayerGestures() throws -> (MJBGesture, MJBGesture) {
        #warning("displaying 으로 로직 이동시키기")
        displayTrun()
        let turnDecision = turn.makeMJBDecision()
        displayTrun()
        let otherDecision = other.makeMJBDecision()
        
        if case MJBDecision.go(let turnGesture) = turnDecision,
           case MJBDecision.go(let otherGesture) = otherDecision {
            return (turnGesture, otherGesture)
        } else {
            throw RPSError.someoneWantsToExit
        }
    }
    
    private func displayResult(_ result: MJBResult) {
        switch result {
        case .win:
            display.displayOutput("\(turn.displayResult())의 승리")
        case .regame:
            display.displayOutput("\(turn.displayResult())의 턴입니다.")
        }
    }
    
    private mutating func changeTurn(to nextTurn: MJBPlayable) {
        self.turn = nextTurn
    }
    
    mutating func start() throws {
        while true {
            let (turnGesture, otherGesture) = try getPlayerGestures()
            let result = MJBPart(turn: turnGesture, other: otherGesture).getResult()
            // TODO: display 로직 고민해보기
            switch result {
            case .win:
                displayResult(result)
                return
            case .regame(let nextTurn):
                changeTurn(to: nextTurn)
                displayResult(result)
                continue
            }
        }
    }
}
