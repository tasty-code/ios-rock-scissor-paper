//
//  File.swift
//  RockPaperScissors
//
//  Created by 권태호 on 29/11/2023.
//

import Foundation

struct GameIOManager {
    func handleUserInput(computerPick: RockScissorPaperUserOption, userChoice: RockScissorPaperUserOption) {
        switch userChoice {
        case .exit:
            GameIOManager.endGame()
        case .scissor, .rock, .paper:
            let result: GameMenuPrompt = RockSicssorPaperGameManager().determineGameResult(computerPick: computerPick, userChoice: userChoice)
            GameIOManager.showGameMenu(for: result)
            if result == .draw {
                return
            } else {
                let iswon = let result == .win
                if iswon {
                    print("[사용자 턴]", terminator: "")
                        MukChiPpaGameManager().playMukChiPpa(turn: .user)
                } else {
                    print("[컴퓨터 턴]", terminator: "")
                    MukChiPpaGameManager().playMukChiPpa(turn: .computer)
                }
            }
        }
    }
    static func showGameMenu(for situation: GameMenuPrompt) {
        switch situation {
        case .menu, .mukChiPpaMenu:
            print(situation.rawValue, terminator: "")
        default:
            print(situation.rawValue)
        }
    }
    static func endGame() {
        showGameMenu(for: .exit)
        isGameRunning = false
    } 
}
