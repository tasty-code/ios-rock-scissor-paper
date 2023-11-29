//
//  Game.swift
//  RockPaperScissors
//
//  Created by 장우석 on 11/21/23.
//

import Foundation

class GameController {
    private let view: View
    private var rockPaperScissorModel: RockPaperScissorsModel
    private var gameStack: [() -> ()]
    private var rockPaperScissorsResultDict: Dictionary<Match, () -> ()>
    private var mukJjiBbaResultDict: Dictionary<Match, () -> ()>
    private var attackPlayer: Player
    private var defensePlayer: Player
    private var isStadardMode: Bool {
        get {
            return attackPlayer.playerType == .none
        }
    }
    
    init() {
        rockPaperScissorsResultDict = [:]
        mukJjiBbaResultDict = [:]
        gameStack = []
        attackPlayer = Player()
        defensePlayer = Player()
        rockPaperScissorModel = RockPaperScissorsModel()
        view = GameView()
        
        gameStack.append(playRockPaperScissorsGame)
        
        rockPaperScissorsResultDict[.win] = rockPaperScissorsWin
        rockPaperScissorsResultDict[.draw] = rockPaperScissorsDraw
        rockPaperScissorsResultDict[.lose] = rockPaperScissorsLose
        
        mukJjiBbaResultDict[.win] = mukJjiBbaDraw
        mukJjiBbaResultDict[.draw] = mukJjiBbaWin
        mukJjiBbaResultDict[.lose] = mukJjiBbaLose
    }
    
    init(rockPaperScissorModel: RockPaperScissorsModel) {
        rockPaperScissorsResultDict = [:]
        mukJjiBbaResultDict = [:]
        gameStack = []
        attackPlayer = Player()
        defensePlayer = Player()
        self.rockPaperScissorModel = rockPaperScissorModel
        view = GameView()
        
        gameStack.append(playRockPaperScissorsGame)
        
        rockPaperScissorsResultDict[.win] = rockPaperScissorsWin
        rockPaperScissorsResultDict[.draw] = rockPaperScissorsDraw
        rockPaperScissorsResultDict[.lose] = rockPaperScissorsLose
        
        mukJjiBbaResultDict[.win] = mukJjiBbaDraw
        mukJjiBbaResultDict[.draw] = mukJjiBbaWin
        mukJjiBbaResultDict[.lose] = mukJjiBbaLose
    }

    public func play() {
        while let game = gameStack.popLast() {
            game()
        }
    }
    
    private func rockPaperScissorsWin() {
        setPlayerType(winPlayer: .user, losePlayer: .computer)
        view.rockPaperScissorsWin()
    }
    
    private func rockPaperScissorsDraw() {
        view.rockPaperScissorsDraw()
    }
    
    private func rockPaperScissorsLose() {
        setPlayerType(winPlayer: .computer, losePlayer: .user)
        view.rockPaperScissorsLose()
    }
    
    private func mukJjiBbaWin() {
        view.finalWin(attackPlayer)
        endGame()
    }
    
    private func mukJjiBbaDraw() {
        pushGame()
        view.turnChange(attackPlayer)
    }
    
    private func mukJjiBbaLose() {
        swapPlayer()
        pushGame()
        view.turnChange(attackPlayer)
    }
    
    private func playRockPaperScissorsGame() {
        view.standardMenu()
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
        
        view.showRockPaperScissorsSelects(userSelect, computerSelect)
        let result = rockPaperScissorModel.matchResult(firstPlayer: userSelect, secondPlayer: computerSelect)
        
        afterRockPaperScissorsProcess(result, userSelect, computerSelect)
    }
    
    private func afterRockPaperScissorsProcess(_ result: Match, _ userSelect: RockPaperScissors, _ computerSelect: RockPaperScissors) {
        guard let process = rockPaperScissorsResultDict[result] else {
            return
        }
        process()
        
        if result != .draw {
            setSelects(userSelect, computerSelect)
        }
        
        pushGame()
    }
    
    private func userInput() -> RockPaperScissors {
        let userSelect: String = readLine() ?? String(RockPaperScissors.wrongCase.rawValue)
        let selectedNum: Int? = Int(userSelect)
        return RockPaperScissors(userSelect: selectedNum)
    }
    
    private func pushGame() {
        if isStadardMode {
            gameStack.append(playRockPaperScissorsGame)
            return
        }
        gameStack.append(playMuckJjiBbaGame)
    }
    
    private func playMuckJjiBbaGame() {
        view.upgradeMenu(attackPlayer)
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
        view.showReadyText(attackPlayer)
        setSelects(userSelect, computerSelect)
        view.showMukJjiBbaSelects(attackPlayer, defensePlayer)
        let result = rockPaperScissorModel.matchResult(firstPlayer: attackPlayer.playerSelect, secondPlayer: defensePlayer.playerSelect)
        
        guard let process = mukJjiBbaResultDict[result] else {
            return
        }
        process()
    }
    
    private func setSelects(_ userSelect: RockPaperScissors, _ computerSelect: RockPaperScissors) {
        if attackPlayer.playerType == .user {
            setPlayerSelect(firstPlayer: userSelect, secondPlayer: computerSelect)
            return
        }
        setPlayerSelect(firstPlayer: computerSelect, secondPlayer: userSelect)
    }
    
    private func setPlayerType(winPlayer: PlayerType, losePlayer: PlayerType) {
        attackPlayer.playerType = winPlayer
        defensePlayer.playerType = losePlayer
    }
    
    private func setPlayerSelect(firstPlayer: RockPaperScissors, secondPlayer: RockPaperScissors) {
        attackPlayer.playerSelect = firstPlayer
        defensePlayer.playerSelect = secondPlayer
    }
    
    private func swapPlayer() {
        let temp: Player = attackPlayer
        attackPlayer = defensePlayer
        defensePlayer = temp
    }
    
    private func wrongCase() {
        view.wrong()
        pushGame()
    }
 
    private func endGame() {
        view.end()
    }
    
}
