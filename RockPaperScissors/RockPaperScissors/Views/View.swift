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
    func showRockPaperScissorsSelects(_ userSelect: RockPaperScissors, _ computerSelect: RockPaperScissors)
    func showMukJjiBbaSelects(_ attackPlayer: Player, _ defensePlayer: Player)
    func showReadyText(_ attackPlayer: Player)
}
