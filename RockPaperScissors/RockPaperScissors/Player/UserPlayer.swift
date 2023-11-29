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
    
    // TODO: 이름
    private func getRPSDecision() throws -> RPSDecision {
        io.displayPrompt("[\(self.name)] 가위(1), 바위(2), 보(3)! <종료 : 0> :")
        let number = try getNumber()
        if let hand = Hand(rpsNumber: number) {
            let gesture = RPSGesture(hand: hand, owner: self)
            return .go(gesture: gesture)
        } else if number == 0 {
            return .stop
        } else {
            throw RPSError.invalidInput
        }
    }
    
    private func getMJBDecision() throws -> MJBDecision {
        #warning("displaying 로직 바꾸면서 같이 바꿔야 함")
        io.displayPrompt("\(self.name) - 묵(1), 찌(2), 빠(3)! <종료 : 0> :")
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
    func makeRPSDecision() -> RPSDecision {
        while true {
            do {
                return try getRPSDecision()
            } catch {
                // TODO: 로직 확인하기
                if let error = error as? RPSError {
                    io.displayRPSError(error)
                }
                continue
            }
        }
    }
}

// MARK: - MJBPlayable
extension UserPlayer: MJBPlayable {
    func makeMJBDecision() -> MJBDecision {
        while true {
            do {
                return try getMJBDecision()
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
        var message = "[\(self.name)] "
        switch result {
        case .win(let winner):
            if let winner = winner as? Self, winner === self {
                message += "이겼습니다!"
            } else {
                message += "졌습니다!"
            }
        case .draw:
            message += "비겼습니다!"
        }
        io.displayOutput(message)
    }
}

extension UserPlayer: MJBResultDisplayable {
    func displayResult() -> String {
        #warning("구현?")
        return name
    }
}
