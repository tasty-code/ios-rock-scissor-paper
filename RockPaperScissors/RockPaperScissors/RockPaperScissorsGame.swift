//
//  Game.swift
//  RockPaperScissors
//
//  Created by 장우석 on 11/21/23.
//

import Foundation

class RockPaperScissorsGame {
    private var gameStack: [() -> ()]
    private var rockPaperScissorsResultDict: Dictionary<Match, () -> ()>
    private var MukJjiBbaResultDict: Dictionary<Match, () -> ()>
    private var attackPlayer: Player
    private var defensePlayer: Player
    
    init() {
        rockPaperScissorsResultDict = [:]
        MukJjiBbaResultDict = [:]
        gameStack = []
        gameStack.append(playRockPaperScissorsGame)
        attackPlayer = Player()
        defensePlayer = Player()
    }
    
    
    func start() {
        while let game = gameStack.popLast() {
            game()
        }
    }
    
    func pushGame() {
        if attackPlayer.playerType == .none {
            gameStack.append(playRockPaperScissorsGame)
        }
        gameStack.append(playMuckJjiBbaGame)
    }
    
    func playRockPaperScissorsGame() {
        let userSelect = RockPaperScissors(userSelect: Int(readLine() ?? String(RockPaperScissors.wrongCase.rawValue)))
        
        if  [RockPaperScissors.wrongCase, RockPaperScissors.exit].contains(userSelect) {
            earlyExit(userSelect)
            return
        }
        
        let comSelect = RockPaperScissors(userSelect: Int.random(in: 1...3))
        
        switch Match.getResult(userSelect, comSelect) {
        case .win:
            print(Message.win.text)
        case .draw:
            print(Message.draw.text)
        case .lose:
            print(Message.lose.text)
        }
    }
    
    func playMuckJjiBbaGame() {
        
    }
    
    func earlyExit(_ userSelect: RockPaperScissors) {
        if userSelect == .wrongCase {
            print(Message.wrong.text)
        } else {
            print(Message.end.text)
            isRunning = false
        }
    }
    
}
