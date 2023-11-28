//
//  GameView.swift
//  RockPaperScissors
//
//  Created by Designer on 11/28/23.
//

import Foundation

struct GameView: View {
    func rockPaperScissorsWin() {
        print(Message.win.text)
    }
    
    func rockPaperScissorsLose() {
        print(Message.lose.text)
    }
    
    func rockPaperScissorsDraw() {
        print(Message.draw.text)
    }
    
    func standardMenu() {
        print(Message.standardMenu.text, terminator: " ")
    }
    
    func upgradeMenu(_ player: Player) {
        print(Message.upgradeMenu(player).text, terminator: " ")
    }
    
    func finalWin(_ player: Player) {
        print(Message.finalWin(player).text)
    }
    
    func turnChange(_ player: Player) {
        print(Message.turnChange(player).text)
    }
    
    func wrong() {
        print(Message.wrong.text)
    }
    
    func end() {
        print(Message.end.text)
    }
    
    
}
