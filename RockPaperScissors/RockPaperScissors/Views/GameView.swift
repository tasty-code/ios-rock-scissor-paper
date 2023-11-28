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
        showImage(attack: userSelect, defense: computerSelect)
    }
    
    func showMukJjiBbaSelects(_ attackPlayer: Player, _ defensePlayer: Player) {
        print("\(attackPlayer.playerType.text) : \(attackPlayer.playerSelect.mukJjiBba)!, \(defensePlayer.playerType.text) : \(defensePlayer.playerSelect.mukJjiBba)")
        showImage(attack: attackPlayer.playerSelect, defense: defensePlayer.playerSelect)
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
    
    func showImage(attack: RockPaperScissors, defense: RockPaperScissors) {
        let attackImage: [String] = attack.image
        let defenseImage: [String] = defense.image
        
        for i in 0...(attackImage.count - 1) {
            var defenseStr: String = String(defenseImage[i].reversed())
            let charArr = Array(defenseStr)
            
            defenseStr = charArr.reduce("", { (partialResult: String, char: String.Element)  -> String in
                var result: String = String(char)
                let temp = String(char)
                if temp == "(" {
                    result = ")"
                }
                if temp == ")" {
                    result = "("
                }
                return partialResult + result
            })
            let center: String = i == 3 ? "VS" : "  "
            print("\(attackImage[i])  \(center)  \(defenseStr)")
        }
    }
}
