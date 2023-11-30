//
//  View.swift
//  RockPaperScissors
//
//  Created by Designer on 11/28/23.
//

import Foundation

protocol View {
    func win(_ player: Player)
    func lose()
    func draw()
    func menu(_ player: Player)
    func turnChange(_ player: Player)
    func showSelects(_ attackPlayer: Player, _ defensePlayer: Player)
    func wrong()
    func end()
    func showReadyText(_ attackPlayer: Player)
}
