//
//  UserPlayer.swift
//  RockPaperScissors
//
//  Created by Effie on 11/28/23.
//

import Foundation

final class UserPlayer {
    private let name: String
    
    private let io: IO
    
    init(io: IO, name: String) {
        self.io = io
        self.name = name
    }
    
    private func getNumber() throws -> Int {
        let inputString = try io.getInput()
        guard let number = Int(inputString) else { throw RPSError.invalidInput }
        return number
    }
    
    private func getDecision() throws -> PlayerDecision {
        io.printPrompt("[\(self.name)] 가위(1), 바위(2), 보(3)! <종료 : 0> :")
        let number = try getNumber()
        if let hand = Hand(rspNumber: number) {
            return .go(hand: hand)
        } else if number == 0 {
            return .stop
        } else {
            throw RPSError.invalidInput
        }
    }
}

extension UserPlayer: Playable {
    func makeDecision() -> PlayerDecision {
        while true {
            do {
                return try getDecision()
            } catch {
                if let error = error as? RPSError {
                    io.printRPSError(error)
                }
                continue
            }
        }
    }
}

extension UserPlayer: GameResultPrintable {
    func print(result: RPSResult) {
        switch result {
        case .win(let winner):
            if let winner = winner as? Self, winner === self {
                io.printOutput("[\(self.name)] 이겼습니다!")
            } else {
                io.printOutput("[\(self.name)] 졌습니다!")
            }
        case .draw:
            io.printOutput("[\(self.name)] 비겼습니다!")
        }
    }
}
