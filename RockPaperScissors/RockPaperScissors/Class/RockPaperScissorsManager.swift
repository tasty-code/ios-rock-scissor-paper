//
//  RockPaperScissorsManager.swift
//  RockPaperScissors
//
//  Created by EUNJU on 2023/11/21.
//

import Foundation

final class RockPaperScissorsManager: Playable {
    
    func validateUserInput(_ input: String?) throws -> RockPaperScissorsType {
        guard let input else {
            throw GameError.invalidInput
        }
        
        switch input {
        case "0": return .none
        case "1": return .scissors
        case "2": return .rock
        case "3": return .paper
        default: throw GameError.invalidInput
        }
    }
    
    func judgeGame(user: RockPaperScissorsType,
                            computer: RockPaperScissorsType?,
                            _ turn: PlayerType = .user) -> UserGuideMessage {
        if user == computer {
            return .draw
        }
        
        switch user {
        case .scissors:
            return computer == .paper ? .win : .lose
        case .rock:
            return computer == .scissors ? .win : .lose
        case .paper:
            return computer == .rock ? .win : .lose
        case .none:
            return .exit
        }
    }
    
    func showMessage(_ messageType: UserGuideMessage, _ turn: String = "") {
        switch messageType {
            
        case .default:
            print("가위(1), 바위(2), 보(3)! <종료 : 0> : ")
        case .win:
            print("이겼습니다!")
        case .lose:
            print("졌습니다!")
        case .draw:
            print("비겼습니다!")
        case .exit:
            print("게임 종료")
        }
    }
}
