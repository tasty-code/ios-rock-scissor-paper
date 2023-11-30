//
//  mukChiPpaGameManager.swift
//  RockPaperScissors
//
//  Created by 권태호 on 29/11/2023.
//

import Foundation


struct mukChiPpaGameManager {
    
    func playMukChiPpa(turn: MuckChiPpaGameTurn) {
        var currentTurn = turn
        while true {
            GameIOmanager.showGameMenu(for: .mukChiPpaMenu)
            guard let input = readLine(), let userChoice = MukChiPpaUserOption(rawValue: input) else {
                GameIOmanager.showGameMenu(for: .error)
                print("[컴퓨터 턴]", terminator: "")
                playMukChiPpa(turn: .computer)
                continue
            }
            if userChoice == .exit {
                GameIOmanager.endGame()
                break
            }
            guard let randomComputerPick = MukChiPpaUserOption.allCases.filter({ $0 != .exit }).randomElement()
            else { continue }
            if userChoice == randomComputerPick {
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
