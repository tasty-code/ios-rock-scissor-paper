//
//  View.swift
//  RockPaperScissors
//
//  Created by Designer on 11/28/23.
//

import Foundation

protocol View {
    func rockPaperScissorsWin()
    func rockPaperScissorsLose()
    func rockPaperScissorsDraw()
    func standardMenu()
    func upgradeMenu(_ player: Player)
    func finalWin(_ player: Player)
    func turnChange(_ player: Player)
    func wrong()
    func end()
}
