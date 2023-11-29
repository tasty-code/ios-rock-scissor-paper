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
        guard let number = Int(inputString) else { throw RPSError.invalidInput }
        return number
    }
    
    // TODO: 이름
    private func getRPSDecision() throws -> RPSGesture {
        io.displayPrompt("\(self.name) - 가위(1), 바위(2), 보(3)! <종료 : 0> :")
        let number = try getNumber()
        if let hand = Hand(rpsNumber: number) {
            return RPSGesture(hand: hand, owner: self)
        } else if number == 0 {
            throw RPSError.someoneWantsToExit
        } else {
            throw RPSError.invalidInput
        }
    }
    
    private func getMJBDecision(currentTurn: MJBPlayable) throws -> MJBDecision {
        io.displayPrompt("[\(currentTurn.name) 턴] \(self.name) - 묵(1), 찌(2), 빠(3)! <종료 : 0> :")
        let number = try getNumber()
        if let hand = Hand(mjbNumber: number) {
            let gesture = MJBGesture(hand: hand, owner: self)
            return .go(gesture: gesture)
        } else if number == 0 {
            return .stop
        } else {
            throw RPSError.invalidInput
        }
    }
}

// MARK: - RPSPlayable
extension UserPlayer: RPSPlayable {
    func makeRPSGesture() throws -> RPSGesture {
        while true {
            do {
                return try getRPSDecision()
            } catch RPSError.invalidInput {
                io.displayRPSError(RPSError.invalidInput)
                continue
            } catch { throw error }
        }
    }
}

// MARK: - MJBPlayable
extension UserPlayer: MJBPlayable {
    func makeMJBDecision(currentTurn: MJBPlayable) -> MJBDecision {
        while true {
            do {
                return try getMJBDecision(currentTurn: currentTurn)
            } catch {
                if let error = error as? RPSError {
                    io.displayRPSError(error)
                }
                continue
            }
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
