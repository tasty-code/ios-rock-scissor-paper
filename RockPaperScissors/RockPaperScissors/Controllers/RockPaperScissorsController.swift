//
//  RockPaperScissorsController.swift
//  RockPaperScissors
//
//  Created by 장우석 on 11/29/23.
//

import Foundation

struct RockPaperScissorsController: Controller {
    internal let view: View
    internal var resultDict: Dictionary<Match, () -> ()>
    private let rockPaperScissorModel: RockPaperScissorsModel
    
    init() {
        view = RockPaperScissorsView()
        rockPaperScissorModel = RockPaperScissorsModel()
        resultDict = Dictionary()
        resultDict[.draw] = draw
        resultDict[.win] = win
        resultDict[.lose] = lose
    }
    
    public mutating func process() {
        view.menu(GamePlayer.main.attackPlayer)
        let userSelect: RockPaperScissors = userInput()
        let computerSelect = rockPaperScissorModel.random()
        
        if userSelect == .exit {
            endGame()
            return
        }
        
        if userSelect == .wrongCase {
            wrongCase()
            return
        }
        
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
    
    internal func userInput() -> RockPaperScissors {
        let userSelect: String = readLine() ?? String(RockPaperScissors.wrongCase.rawValue)
        let selectedNum: Int? = Int(userSelect)
        return RockPaperScissors(userSelect: selectedNum)
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
    
    private func wrongCase() {
        view.wrong()
        GamePlayer.main.pushGame()
    }
 
    private func endGame() {
        view.end()
    }
}
