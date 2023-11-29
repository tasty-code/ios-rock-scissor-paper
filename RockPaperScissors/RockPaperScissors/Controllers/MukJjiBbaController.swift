//
//  MukJjiBbaController.swift
//  RockPaperScissors
//
//  Created by 장우석 on 11/29/23.
//

import Foundation

class MukJjiBbaController: Controller {
    internal var view: View
    internal var resultDict: Dictionary<Match, () -> ()>
    private var rockPaperScissorModel: RockPaperScissorsModel
    
    init() {
        view = MukJjiBbaView()
        rockPaperScissorModel = RockPaperScissorsModel()
        resultDict = Dictionary()
        resultDict[.draw] = win
        resultDict[.win] = draw
        resultDict[.lose] = lose
    }
    
    func process() {
        view.menu(GamePlayer.main.attackPlayer)
        let userSelect: RockPaperScissors = rockPaperScissorModel.convertRockPaperScissors(userInput())
        let computerSelect = rockPaperScissorModel.random()
        
        if userSelect == .exit {
            endGame()
            return
        }
        
        if userSelect == .wrongCase {
            wrongCase()
            return
        }
        
        view.showReadyText(GamePlayer.main.attackPlayer)
        GamePlayer.main.setSelects(userSelect, computerSelect)
        view.showSelects(GamePlayer.main.attackPlayer, GamePlayer.main.defensePlayer)
        let result = rockPaperScissorModel.matchResult(GamePlayer.main.attackPlayer, GamePlayer.main.defensePlayer)
        
        guard let aterProcess = resultDict[result] else {
            return
        }
        aterProcess()
    }
    
    private func win() {
        view.win(GamePlayer.main.attackPlayer)
        endGame()
    }
    
    private func draw() {
        GamePlayer.main.pushGame()
        view.turnChange(GamePlayer.main.attackPlayer)
    }
    
    private func lose() {
        GamePlayer.main.swapPlayer()
        GamePlayer.main.pushGame()
        view.turnChange(GamePlayer.main.attackPlayer)
    }
    
    internal func userInput() -> RockPaperScissors {
        let userSelect: String = readLine() ?? String(RockPaperScissors.wrongCase.rawValue)
        let selectedNum: Int? = Int(userSelect)
        return RockPaperScissors(userSelect: selectedNum)
    }
    
    private func wrongCase() {
        view.wrong()
        GamePlayer.main.pushGame()
    }
 
    private func endGame() {
        view.end()
    }
    
}
