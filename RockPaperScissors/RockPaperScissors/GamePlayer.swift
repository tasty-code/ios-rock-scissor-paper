//
//  Game.swift
//  RockPaperScissors
//
//  Created by 장우석 on 11/29/23.
//

import Foundation

class GamePlayer {
    public static var main: GamePlayer  = GamePlayer()
    private var rockPaperScissors: Game
    private var mukJjiBba: Game
    private var gameStack: [Game]
    public var attackPlayer: Player
    public var defensePlayer: Player
    private var isStadardMode: Bool {
        get {
            return attackPlayer.playerType == .none
        }
    }
    
    private init() {        
        rockPaperScissors = RockPaperScissorsGame()
        mukJjiBba = MukJjiBbaGame()
        gameStack = []
        attackPlayer = Player()
        defensePlayer = Player()
        gameStack.append(rockPaperScissors)
    }
    
    public func play() {
        while var game = gameStack.popLast() {
            game.play()
        }
    }
    
    public func pushGame() {
        if isStadardMode {
            gameStack.append(rockPaperScissors)
            return
        }
        gameStack.append(mukJjiBba)
    }
    
    public func setSelects(_ userSelect: RockPaperScissors, _ computerSelect: RockPaperScissors) {
        if attackPlayer.playerType == .user {
            setPlayerSelect(firstPlayer: userSelect, secondPlayer: computerSelect)
            return
        }
        setPlayerSelect(firstPlayer: computerSelect, secondPlayer: userSelect)
    }
    
    public func setPlayerType(winPlayer: PlayerType, losePlayer: PlayerType) {
        attackPlayer.playerType = winPlayer
        defensePlayer.playerType = losePlayer
    }
    
    public func setPlayerSelect(firstPlayer: RockPaperScissors, secondPlayer: RockPaperScissors) {
        attackPlayer.playerSelect = firstPlayer
        defensePlayer.playerSelect = secondPlayer
    }
    
    public func swapPlayer() {
        let temp: Player = attackPlayer
        attackPlayer = defensePlayer
        defensePlayer = temp
    }
    
}
