//
//  UserPlayer.swift
//  RockPaperScissors
//
//  Created by Effie on 11/28/23.
//

import Foundation

final class UserPlayer {
    let name: String
    
    private let io: IO
    
    init(io: IO, name: String) {
        self.io = io
        self.name = name
    }
    
    private func getNumber() throws -> Int {
        let inputString = try io.getInput()
        guard let number = Int(inputString) else { throw HandGameError.invalidInput }
        return number
    }
    
    private func getRPSGesture() throws -> RPSGesture {
        io.displayPrompt("\(self.name) - 가위(1), 바위(2), 보(3)! <종료 : 0> :")
        let number = try getNumber()
        if let hand = Hand(rpsNumber: number) {
            return RPSGesture(hand: hand, owner: self)
        } else if number == 0 {
            throw HandGameError.someoneWantsToExit
        } else {
            throw HandGameError.invalidInput
        }
    }
    
    private func getMJBGesture(currentTurn: MJBPlayable) throws -> MJBGesture {
        io.displayPrompt("[\(currentTurn.name) 턴] \(self.name) - 묵(1), 찌(2), 빠(3)! <종료 : 0> :")
        let number = try getNumber()
        if let hand = Hand(mjbNumber: number) {
            return MJBGesture(hand: hand, owner: self)
        } else if number == 0 {
            throw HandGameError.someoneWantsToExit
        } else {
            throw HandGameError.invalidInput
        }
    }
}

// MARK: - RPSPlayable
extension UserPlayer: RPSPlayable {
    func makeRPSGesture() throws -> RPSGesture {
        while true {
            do {
                return try getRPSGesture()
            } catch HandGameError.invalidInput {
                io.displayRPSError(HandGameError.invalidInput)
                continue
            } catch { throw error }
        }
    }
}

// MARK: - MJBPlayable
extension UserPlayer: MJBPlayable {
    func makeMJBGesture(currentTurn: MJBPlayable) throws -> MJBGesture {
        while true {
            do {
                return try getMJBGesture(currentTurn: currentTurn)
            } catch HandGameError.invalidInput {
                io.displayRPSError(HandGameError.invalidInput)
                continue
            } catch { throw error }
        }
    }
}

// MARK: - RPSResultDisplayable
extension UserPlayer: RPSResultDisplayable {
    func display(result: RPSResult) {
        let message: String
        switch result {
        case .win(let winner):
            message = (winner === self) ? "이겼습니다!" : "졌습니다!"
        case .draw:
            message = "비겼습니다!"
        }
        io.displayOutput(message)
    }
}

// MARK: - CallablePlayer
extension UserPlayer: CallablePlayer {
    func getName() -> String {
        return self.name
    }
}

// MARK: - MJBResultDisplayable
extension UserPlayer: MJBResultDisplayable {
    func display(result: MJBResult) {
        io.displayOutput(result.description)
    }
}
