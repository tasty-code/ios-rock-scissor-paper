//
//  Game.swift
//  RockPaperScissors
//
//  Created by 장우석 on 11/21/23.
//

import Foundation

class GameController {
    private var gameStack: [() -> ()]
    private var rockPaperScissorsResultDict: Dictionary<Match, () -> ()>
    private var mukJjiBbaResultDict: Dictionary<Match, () -> ()>
    private var attackPlayer: Player
    private var defensePlayer: Player
    private var model: RockPaperScissorsModel
    private let view: View
    
    
    init() {
        rockPaperScissorsResultDict = [:]
        mukJjiBbaResultDict = [:]
        gameStack = []
        attackPlayer = Player()
        defensePlayer = Player()
        model = RockPaperScissorsModel()
        view = GameView()
        
        gameStack.append(playRockPaperScissorsGame)
        
        rockPaperScissorsResultDict[.win] = rockPaperScissorsWin
        rockPaperScissorsResultDict[.draw] = rockPaperScissorsDraw
        rockPaperScissorsResultDict[.lose] = rockPaperScissorsLose
        
        mukJjiBbaResultDict[.win] = mukJjiBbaDraw
        mukJjiBbaResultDict[.draw] = mukJjiBbaWin
        mukJjiBbaResultDict[.lose] = mukJjiBbaLose
    }
    
    
    func play() {
        while let game = gameStack.popLast() {
            game()
        }
    }
    
    func pushGame() {
        if attackPlayer.playerType == .none {
            gameStack.append(playRockPaperScissorsGame)
            return
        }
        gameStack.append(playMuckJjiBbaGame)
    }
    
    func playRockPaperScissorsGame() {
        view.standardMenu()
        let userSelect: RockPaperScissors = userInput()
        let computerSelect = model.random()
        
        if userSelect == .exit {
            endGame()
            return
        }
        
        if userSelect == .wrongCase {
            wrongCase()
            return
        }
        
        view.showRockPaperScissorsSelects(userSelect, computerSelect)
        let result = model.matchResult(firstPlayer: userSelect, secondPlayer: computerSelect)
        
        afterRockPaperScissorsProcess(result, userSelect, computerSelect)
    }
    
    func afterRockPaperScissorsProcess(_ result: Match, _ userSelect: RockPaperScissors, _ computerSelect: RockPaperScissors) {
        guard let process = rockPaperScissorsResultDict[result] else { return }
        process()
        
        if result != .draw {
            setSelects(userSelect, computerSelect)
        }
        
        pushGame()
    }

    
    func playMuckJjiBbaGame() {
        view.upgradeMenu(attackPlayer)
        let userSelect: RockPaperScissors = model.convertRockPaperScissors(userInput())
        let computerSelect = model.random()
        
        if userSelect == .exit {
            endGame()
            return
        }
        
        if userSelect == .wrongCase {
            wrongCase()
            return
        }
        view.showReadyText(attackPlayer)
        setSelects(userSelect, computerSelect)
        view.showMukJjiBbaSelects(attackPlayer, defensePlayer)
        let result = model.matchResult(firstPlayer: userSelect, secondPlayer: computerSelect)
        
        guard let process = mukJjiBbaResultDict[result] else { return }
        process()
    }
    
    func userInput() -> RockPaperScissors {
        let userSelect: String = readLine() ?? String(RockPaperScissors.wrongCase.rawValue)
        let selectedNum: Int? = Int(userSelect)
        return RockPaperScissors(userSelect: selectedNum)
    }
    
    func setSelects(_ userSelect: RockPaperScissors, _ computerSelect: RockPaperScissors) {
        if attackPlayer.playerType == .user {
            setPlayerSelect(firstPlayer: userSelect, secondPlayer: computerSelect)
            return
        }
        setPlayerSelect(firstPlayer: computerSelect, secondPlayer: userSelect)
    }
    
    func setPlayerType(winPlayer: PlayerType, losePlayer: PlayerType) {
        attackPlayer.playerType = winPlayer
        defensePlayer.playerType = losePlayer
    }
    
    func setPlayerSelect(firstPlayer: RockPaperScissors, secondPlayer: RockPaperScissors) {
        attackPlayer.playerSelect = firstPlayer
        defensePlayer.playerSelect = secondPlayer
    }
    
    func rockPaperScissorsWin() {
        setPlayerType(winPlayer: .user, losePlayer: .computer)
        view.rockPaperScissorsWin()
    }
    
    func rockPaperScissorsDraw() {
        view.rockPaperScissorsDraw()
    }
    
    func rockPaperScissorsLose() {
        setPlayerType(winPlayer: .computer, losePlayer: .user)
        view.rockPaperScissorsLose()
    }
    
    func mukJjiBbaWin() {
        view.finalWin(attackPlayer)
    }
    
    func mukJjiBbaDraw() {
        pushGame()
        view.turnChange(attackPlayer)
    }
    
    func mukJjiBbaLose() {
        swapPlayer()
        pushGame()
        view.turnChange(attackPlayer)
    }
    
    func swapPlayer() {
        let temp:Player = attackPlayer
        attackPlayer = defensePlayer
        defensePlayer = temp
    }
    
    func wrongCase() {
        view.wrong()
        pushGame()
    }
 
    func endGame() {
        view.end()
    }
    
}
