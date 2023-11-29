//
//  Playable.swift
//  RockPaperScissors
//
//  Created by Minho on 11/29/23.
//

protocol Playable {
    func playGame() -> GameState
    func decideGameResult() -> GameResult
    func convertInput(_ input: Int) -> RockPaperScissor
}
