//
//  File.swift
//  RockPaperScissors
//
//  Created by 권태호 on 29/11/2023.
//

import Foundation

struct GameIOmanager {
    func handleUserInput(computerPick: RockScissorPaperUserOption, userChoice: RockScissorPaperUserOption) {
        switch userChoice {
        case .exit:
            GameIOmanager.endGame()
        case .scissor, .rock, .paper:
            let result: GameMenuPrompt = rockSicssorPaperGameManager().determineGameResult(computerPick: computerPick, userChoice: userChoice)
            GameIOmanager.showGameMenu(for: result)
            if result == .draw {
                return
            } else {
                let iswon = result == .win
                if iswon {
                    print("[사용자 턴]", terminator: "")
                        mukChiPpaGameManager().playMukChiPpa(turn: .user)
                } else {
                    print("[컴퓨터 턴]", terminator: "")
                    mukChiPpaGameManager().playMukChiPpa(turn: .computer)
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
