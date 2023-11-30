//
//  GameMaster.swift
//  RockPaperScissors
//
//  Created by Taewan Kim on 11/30/23.
//

import Foundation

struct GameMaster {
    private let gameController = GameController()
    
    func startRockScissorsPaperGame() {
        while true {
            print(StringConstants.RockScissorsPaper.mainQuestion, terminator: "")
            
            guard let playerChoiceInt = gameController.inputPlayerChoiceInt() else {
                continue
            }
            
            if playerChoiceInt == 0 {
                return
            }
            
            guard let playerChoice = gameController.convertChoiceFromInt(choiceInt: playerChoiceInt) else {
                continue
            }
            
            guard let computerChoice = gameController.randomHandChoice() else {
                continue
            }
            
            let rockScissorsPaperResult = gameController.judgeRefereeRockScissorsPaper(player: playerChoice, computer: computerChoice)
            
            switch rockScissorsPaperResult {
            case .win:
                print(StringConstants.RockScissorsPaper.winRockScissorsPaper)
                startMukJjiBbaGame(winningTurn: .playerTurn)
                return
            case .lose:
                print(StringConstants.RockScissorsPaper.loseRockScissorsPaper)
                startMukJjiBbaGame(winningTurn: .computerTurn)
                return
            case .draw:
                print(StringConstants.RockScissorsPaper.drawRockScissorsPaper)
            }
        }
    }

    func startMukJjiBbaGame(winningTurn: WinningTurn) {
        var gameTurn = winningTurn
        
        while true {
            switch gameTurn {
            case .playerTurn:
                print(StringConstants.MukJjiBba.playerTurnMainQuestion, terminator: " ")
                
                guard let playerChoiceInt = gameController.inputPlayerChoiceInt() else {
                    continue
                }

                if playerChoiceInt == 0 {
                    return
                }
                
                guard let playerChoice = gameController.convertChoiceFromInt(choiceInt: playerChoiceInt) else {
                    continue
                }
                
                guard let computerChoice = gameController.randomHandChoice() else {
                    continue
                }
                
                let mukJjiBbaResult = gameController.judgeRefereeMukJjiBba(player: playerChoice, computer: computerChoice)
                
                switch mukJjiBbaResult {
                case .playerTurn:
                    gameTurn = .computerTurn
                    print(StringConstants.MukJjiBba.computerTurn)
                case .computerTurn:
                    gameTurn = .playerTurn
                    print(StringConstants.MukJjiBba.playerTurn)
                case .win:
                    print("\(gameTurn)의 승리!")
                    return
                }
            case .computerTurn:
                print(StringConstants.MukJjiBba.computerTurnMainQuestion, terminator: " ")
                
                guard let playerChoiceInt = gameController.inputPlayerChoiceInt() else {
                    continue
                }
                
                guard let playerChoice = HandChoice(rawValue: playerChoiceInt) else {
                    continue
                }
                
                guard let computerChoice = gameController.randomHandChoice() else {
                    continue
                }
                
                let result = gameController.judgeRefereeMukJjiBba(player: playerChoice, computer: computerChoice)
                
                switch result {
                case .playerTurn:
                    gameTurn = .computerTurn
                    print(StringConstants.MukJjiBba.computerTurn)
                case .computerTurn:
                    gameTurn = .playerTurn
                    print(StringConstants.MukJjiBba.playerTurn)
                case .win:
                    print("\(gameTurn)의 승리!")
                    return
                }
            }
        }
    }
}
