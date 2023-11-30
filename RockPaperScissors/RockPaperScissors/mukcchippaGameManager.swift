//
//  mukcchippaGameManager.swift
//  RockPaperScissors
//
//  Created by 권태호 on 29/11/2023.
//

import Foundation


struct mukcchippaGameManager {
    
    func playMukChiPPa(turn: mukchippaGamreTurn) {
        var currentTurn = turn
        
        while true {
            GameIOmanager.showGameMenu(for: .mukChiPPaMenu)
            
            guard let input = readLine(), let userMukChiPPa = MukChiPPaOption(rawValue: input) else {
                GameIOmanager.showGameMenu(for: .error)
                print("[컴퓨터턴]", terminator: "")
                playMukChiPPa(turn: .computer)
                continue
            }
            
            if userMukChiPPa == .exit {
                print("게임 종료")
                GameIOmanager.endGame()
                break
            }
                guard let comMukChiPPa = MukChiPPaOption(rawValue: String(Int.random(in: 1...3))) else {
                continue
            }
            if userMukChiPPa == comMukChiPPa {
                if currentTurn == .user {
                    print("사용자의 승리!")
                } else {
                    print("컴퓨터의 승리!")
                }
                GameIOmanager.endGame()
                break
            } else {
                currentTurn.toggle()
                if currentTurn == .user {
                    print("사용자의 턴입니다.")
                } else {
                    print("컴퓨터의 턴입니다.")
                }
                print(currentTurn == .user ? "[사용자 턴]" : "[컴퓨터 턴]" ,terminator: "" )
            }
        }
    }
   
}
