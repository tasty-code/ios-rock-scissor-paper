//
//  File.swift
//  RockPaperScissors
//
//  Created by 권태호 on 29/11/2023.
//

import Foundation


struct GameIOmanager {

    func handleUserInput(comPick: UserMenuOption, userPick: UserMenuOption) {
        switch userPick {
        case .exit:
            GameIOmanager.endGame()
        case .scissor, .rock, .paper:
            let result: GameMenuPrompt = rockSicssorPaperGameManager().determineGameResult(comPick: comPick, userChoice: userPick)
            GameIOmanager.showGameMenu(for: result)
            if result == .draw {
                return
            } else {
                let userWon = result == .win ? true : false
                if userWon {
                    print("[사용자 턴]", terminator: "")
                        mukcchippaGameManager().playMukChiPPa(turn: .user)
                } else {
                    print("[컴퓨터 턴]", terminator: "")
                    mukcchippaGameManager().playMukChiPPa(turn: .computer)
                }
            }
        }
    }
    
    static func showGameMenu(for situation: GameMenuPrompt) {
        switch situation {
        case .menu, .mukChiPPaMenu, .exit:
            print(situation.rawValue, terminator: "")
        case .error:
            print(situation.rawValue)
        default:
            print(situation.rawValue)
        }
    }

    static func endGame() {
        showGameMenu(for: .exit)
        isGameRunning = false
    }    
}
