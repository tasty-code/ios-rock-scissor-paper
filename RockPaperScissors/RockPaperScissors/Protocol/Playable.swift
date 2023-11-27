//
//  Playable.swift
//  RockPaperScissors
//
//  Created by EUNJU on 2023/11/24.
//

import Foundation

protocol Playable {
    
    func validateUserInput(_ input: String?) throws -> RockPaperScissorsType
    func judgeGame(user: RockPaperScissorsType, computer: RockPaperScissorsType?, _ turn: PlayerType) -> UserGuideMessage
    func showMessage(_ messageType: UserGuideMessage, _ turn: PlayerType)
    func playGame(_ result: UserGuideMessage) -> UserGuideMessage
}
