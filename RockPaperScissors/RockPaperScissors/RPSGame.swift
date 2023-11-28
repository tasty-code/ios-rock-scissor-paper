//
//  RPSGame.swift
//  RockPaperScissors
//
//  Created by Effie on 11/28/23.
//

import Foundation

struct RPSGame {
    private let io: IO
    
    init(io: IO) {
        self.io = io
    }
    
    private func getUserHand() throws -> Hand {
        io.printPrompt("가위(1), 바위(2), 보(3)! <종료 : 0> :")
        let inputString = try io.getInput()
        guard let number = Int(inputString) else { throw RPSError.invalidInput }
        if let hand = Hand(rspNumber: number) {
            return hand
        } else if number == 0 {
            throw RPSError.userWantsToExit
        } else {
            throw RPSError.invalidInput
        }
    }
    
    func play() throws -> PlayerType {
        while true {
            do {
                let userHand = try getUserHand()
                let userSideResult = HandGameRound(userHand: userHand).getUserSideResult()
                switch userSideResult {
                case .draw:
                    print("비겼습니다!")
                    continue
                case .win:
                    print("이겼습니다!")
                    return .user
                case .lose:
                    print("졌습니다!")
                    return .computer
                }
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
