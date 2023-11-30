//
//  MukJjiBbaController.swift
//  RockPaperScissors
//
//  Created by 장우석 on 11/29/23.
//

import Foundation

class MukJjiBbaController: Controller {
    var handler: Handler
    internal let view: View
    internal var resultDict: Dictionary<Match, () -> ()>
    private let rockPaperScissorModel: RockPaperScissorsModel
    
    init() {
        handler = Handler()
        view = MukJjiBbaView()
        rockPaperScissorModel = RockPaperScissorsModel()
        resultDict = Dictionary()
        resultDict[.draw] = win
        resultDict[.win] = draw
        resultDict[.lose] = lose
    }
    
    func process() {
        view.menu(GamePlayer.main.attackPlayer)
        guard var userSelect = handler.inputHandler() else {
            return
        }
        userSelect = rockPaperScissorModel.convertRockPaperScissors(userSelect)
        let computerSelect = rockPaperScissorModel.random()
        
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
        handler.endGame()
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
    
}
