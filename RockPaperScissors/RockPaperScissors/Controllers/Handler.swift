//
//  Handler.swift
//  RockPaperScissors
//
//  Created by 장우석 on 11/30/23.
//

import Foundation

class Handler {
    let view: View = RockPaperScissorsView()
    
    public func inputHandler() -> RockPaperScissors? {
        let userSelect: RockPaperScissors = userInput()
        if userSelect == .exit {
            endGame()
            return nil
        }
        if userSelect == .wrongCase {
            wrongCase()
            return nil
        }
        return userSelect
    }
    
    private func userInput() -> RockPaperScissors {
        let userSelect: String = readLine() ?? String(RockPaperScissors.wrongCase.rawValue)
        let selectedNum: Int? = Int(userSelect)
        return RockPaperScissors(userSelect: selectedNum)
    }
    
    private func wrongCase() {
        view.wrong()
        GamePlayer.main.pushGame()
    }
 
    public func endGame() {
        view.end()
    }
}
