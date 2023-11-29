//
//  MJBIteration.swift
//  RockPaperScissors
//
//  Created by Effie on 11/28/23.
//

import Foundation

enum MJBResult {
    case win
    case regame(nextTurn: MJBPlayable)
}

struct MJBPart {
    private let turn: MJBGesture
    private let other: MJBGesture
    
    init(turn: MJBGesture, other: MJBGesture) {
        self.turn = turn
        self.other = other
    }
    
    func getResult() -> MJBResult {
        let turnHand = turn.hand
        let otherHand = other.hand
        
        if turnHand == otherHand {
            return .win
        } else {
            let winningGesture = turnHand.wins(otherHand) ? turn : other
            let nextTurn = winningGesture.owner
            return .regame(nextTurn: nextTurn)
        }
    }
}

struct MJBIteration {
    private let leftPlayer: MJBPlayable
    
    private let rightPlayer: MJBPlayable
    
    private var turn: MJBPlayable
    
    private var other: MJBPlayable {
        get {
            return self.turn === leftPlayer ? rightPlayer : leftPlayer
        }
    }
    
    private let printer: PromptPrintable & OuputPritable
    
    init(turn: MJBPlayable, other: MJBPlayable, resultPrinter: PromptPrintable & OuputPritable) {
        self.turn = turn
        self.leftPlayer = self.turn
        self.rightPlayer = other
        self.printer = resultPrinter
    }
    
#warning("displaying 으로 로직 이동시키기")
    private func printTrun() {
        let turnName = turn.displayResult()
        printer.printPrompt("[\(turnName) 턴]")
    }
    
    // TODO: Playable 사용할 수 있도록 개선해보기
    private func getPlayerGestures() throws -> (MJBGesture, MJBGesture) {
        #warning("displaying 으로 로직 이동시키기")
        printTrun()
        let turnDecision = turn.makeMJBDecision()
        printTrun()
        let otherDecision = other.makeMJBDecision()
        
        if case MJBDecision.go(let turnGesture) = turnDecision,
           case MJBDecision.go(let otherGesture) = otherDecision {
            return (turnGesture, otherGesture)
        } else {
            throw RPSError.someoneWantsToExit
        }
    }
    
    private func printResult(_ result: MJBResult) {
        switch result {
        case .win:
            printer.printOutput("\(turn.displayResult())의 승리")
        case .regame:
            printer.printOutput("\(turn.displayResult())의 턴입니다.")
        }
    }
    
    private mutating func changeTurn(to nextTurn: MJBPlayable) {
        self.turn = nextTurn
    }
    
    mutating func start() throws {
        while true {
            let (turnGesture, otherGesture) = try getPlayerGestures()
            let result = MJBPart(turn: turnGesture, other: otherGesture).getResult()
            // TODO: print 로직 고민해보기
            switch result {
            case .win:
                printResult(result)
                return
            case .regame(let nextTurn):
                changeTurn(to: nextTurn)
                printResult(result)
                continue
            }
        }
    }
}
