//
//  RockPaperScissorsView.swift
//  RockPaperScissors
//
//  Created by 장우석 on 11/29/23.
//

import Foundation

struct RockPaperScissorsView: View {
    func win(_ player: Player) {
        let space: String = "                    "
        print(space + Message.win.text)
    }
    
    func lose() {
        let space: String = "                    "
        print(space + Message.lose.text)
    }
    
    func draw() {
        let space: String = "                    "
        print(space + Message.draw.text)
    }
    
    func menu(_ player: Player) {
        print(Message.standardMenu.text, terminator: " ")
    }
    
    func turnChange(_ player: Player) {
        let space: String = "                 "
        print(space + Message.turnChange(player).text)
    }
    
    func showSelects(_ attackPlayer: Player, _ defensePlayer: Player) {
        let space: String = "                        "
        print("사용자 : \(attackPlayer.playerSelect.korean) \(space) 컴퓨터 : \(defensePlayer.playerSelect.korean)")
        showImage(attack: attackPlayer.playerSelect, defense: defensePlayer.playerSelect)
    }
    
    func wrong() {
        print(Message.wrong.text)
    }
    
    func end() {
        print(Message.end.text)
    }
    
    func showReadyText(_ attackPlayer: Player) {
        let space: String = "                  "
        print("\(space)\(attackPlayer.playerSelect.mukJjiBba)... \(attackPlayer.playerSelect.mukJjiBba)...")
    }
    
    private func showImage(attack: RockPaperScissors, defense: RockPaperScissors) {
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
