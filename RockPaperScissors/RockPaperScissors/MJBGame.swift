//
//  MJBGame.swift
//  RockPaperScissors
//
//  Created by Effie on 11/28/23.
//

import Foundation

// TODO: class vs. struct
class MJBGame {
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
    
    func play() throws {
        while true {
            do {
                let userHand = try getUserHand()
                let userSideResult = HandGameRound(userHand: userHand).getUserSideResult()
                switch userSideResult {
                case .draw:
                    io.printOutPut("\(self.turn)의 승리!")
                    return
                case .win:
                    self.turn = .user
                    continue
                case .lose:
                    self.turn = .computer
                    continue
                }
                io.printOutPut("\(self.turn)의 턴입니다.")
            } catch {
                switch error {
                case RPSError.invalidInput:
                    io.printOutPut("잘못된 입력입니다. 다시 시도해주세요.")
                    continue
                default:
                    throw error
                }
            }
        }
    }
}
