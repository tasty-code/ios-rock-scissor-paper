//
//  Playable.swift
//  RockPaperScissors
//
//  Created by Minho on 11/29/23.
//

protocol Playable {
    func decideGameResult(user: Player, opponent: Player) -> GameResult
    func convertInput(_ input: Int) -> RockPaperScissor
}
