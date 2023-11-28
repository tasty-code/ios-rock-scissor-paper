//
//  GameView.swift
//  RockPaperScissors
//
//  Created by Designer on 11/28/23.
//

import Foundation

struct GameView: View {
    func showReadyText(_ attackPlayer: Player) {
        print("\(attackPlayer.playerSelect.mukJjiBba)... \(attackPlayer.playerSelect.mukJjiBba)...")
    }
    
    func showRockPaperScissorsSelects(_ userSelect: RockPaperScissors, _ computerSelect: RockPaperScissors) {
        print("사용자 : \(userSelect.korean), 컴퓨터 : \(computerSelect.korean)")
    }
    
    func showMukJjiBbaSelects(_ attackPlayer: Player, _ defensePlayer: Player) {
        print("\(attackPlayer.playerType.text) : \(attackPlayer.playerSelect.mukJjiBba)!, \(defensePlayer.playerType.text) : \(defensePlayer.playerSelect.mukJjiBba)")
    }
    
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
