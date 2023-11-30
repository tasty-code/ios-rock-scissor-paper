//
//  RockPaperScissorsController.swift
//  RockPaperScissors
//
//  Created by 장우석 on 11/29/23.
//

import Foundation

struct RockPaperScissorsController: Controller {
    var handler: Handler
    internal let view: View
    internal var resultDict: Dictionary<Match, () -> ()>
    private let rockPaperScissorModel: RockPaperScissorsModel
    
    init() {
        handler = Handler()
        view = RockPaperScissorsView()
        rockPaperScissorModel = RockPaperScissorsModel()
        resultDict = Dictionary()
        resultDict[.draw] = draw
        resultDict[.win] = win
        resultDict[.lose] = lose
    }
    
    public mutating func process() {
        view.menu(GamePlayer.main.attackPlayer)
        guard let userSelect: RockPaperScissors = handler.inputHandler() else {
            return 
        }
        let computerSelect = rockPaperScissorModel.random()
        
        view.showSelects(Player(userSelect), Player(computerSelect))
        let result = rockPaperScissorModel.matchResult(Player(userSelect), Player(computerSelect))
        
        afterRockPaperScissorsProcess(result, userSelect, computerSelect)
    }
    
    private mutating func afterRockPaperScissorsProcess(_ result: Match, _ userSelect: RockPaperScissors, _ computerSelect: RockPaperScissors) {
        guard let aterProcess = resultDict[result] else {
            return
        }
        aterProcess()
        
        if result != .draw {
            GamePlayer.main.setSelects(userSelect, computerSelect)
        }
        
        GamePlayer.main.pushGame()
    }
    
    private func win() {
        GamePlayer.main.setPlayerType(winPlayer: .user, losePlayer: .computer)
        view.win(GamePlayer.main.attackPlayer)
    }
    
    private func draw() {
        view.draw()
    }
    
    private func lose() {
        GamePlayer.main.setPlayerType(winPlayer: .computer, losePlayer: .user)
        view.lose()
    }
}
