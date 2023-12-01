//
//  mukChiPpaGameManager.swift
//  RockPaperScissors
//
//  Created by 권태호 on 29/11/2023.
//

import Foundation

struct MukChiPpaGameManager {
    func playMukChiPpa(turn: MukChiPpaGameTurn) {
        var currentTurn = turn
        while currentTurn == .computer || currentTurn == .computer {
            GameIOManager.showGameMenu(for: .mukChiPpaMenu)
            guard
                let input = readLine(),
                let userInput = Int(input),
                let userChoice = MukChiPpaUserOption(rawValue: userInput)
            else {
                GameIOManager.showGameMenu(for: .error)
                print("[컴퓨터 턴]", terminator: "")
                continue
            }
            guard userChoice != .exit else { return GameIOManager.endGame() }
            guard let randomComputerPick = MukChiPpaUserOption.allCases.filter({ $0 != .exit }).randomElement()
            else { continue }
            if userChoice == randomComputerPick {
                if currentTurn == .user {
                    GameIOManager.showGameMenu(for: .mukchippaUserWin)
                } else {
                    GameIOManager.showGameMenu(for: .mukchippaComputerWin)
                }
                GameIOManager.endGame()
                break
            } else {
                currentTurn.toggle()
                print(currentTurn == .user ? "[사용자 턴]" : "[컴퓨터 턴]" ,terminator: "" )
            }
        }
    }
}
