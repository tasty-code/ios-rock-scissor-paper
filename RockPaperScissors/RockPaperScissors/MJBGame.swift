//
//  MJBGame.swift
//  RockPaperScissors
//
//  Created by Effie on 11/28/23.
//

import Foundation

struct MJBGame {
    private var turn: PlayerType
    
    private let io: IO
    
    init(io: IO, turn: PlayerType) {
        self.io = io
        self.turn = turn
    }
    
    private func getUserHand() throws -> Hand {
        io.printPrompt("[\(self.turn) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> :")
        let inputString = try io.getInput()
        guard let number = Int(inputString) else { throw RPSError.invalidInput }
        if let hand = Hand(mjbNumber: number) {
            return hand
        } else if number == 0 {
            throw RPSError.userWantsToExit
        } else {
            throw RPSError.invalidInput
        }
    }
    
    private mutating func changeTurn(to newTurn: PlayerType) {
        self.turn = newTurn
    }
    
    mutating func play() throws {
        while true {
            do {
                let userHand = try getUserHand()
                let userSideResult = HandGameRound(userHand: userHand).getUserSideResult()
                switch userSideResult {
                case .draw:
                    io.printOutput("\(self.turn)의 승리!")
                    return
                case .win:
                    changeTurn(to: .user)
                case .lose:
                    changeTurn(to: .computer)
                }
                io.printOutput("\(self.turn)의 턴입니다.")
                continue
            } catch {
                switch error {
                case RPSError.invalidInput:
                    io.printOutput("잘못된 입력입니다. 다시 시도해주세요.")
                    continue
                default:
                    throw error
                }
            }
        }
    }
}
