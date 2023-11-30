//
//  Playable.swift
//  RockPaperScissors
//
//  Created by misung & UngQ on 11/29/23.
//

protocol Playable {
    func decideGameResult(user: Player, opponent: Player) -> GameResult
}
