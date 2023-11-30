//
//  JudgeGame.swift
//  RockPaperScissors
//
//  Created by EUNJU on 2023/11/30.
//

import Foundation

protocol JudgeRockPaperScissors {
    func judgeGame(userChoice: RockPaperScissorsType?, computerChoice: RockPaperScissorsType?) -> GameResultType
}

protocol JudgeAdvancedRockPaperScissors {
    func judgeGame(userChoice: AdvancedRockPaperScissorsType?, computerChoice: AdvancedRockPaperScissorsType?, turn: PlayerType) -> GameResultType
}
