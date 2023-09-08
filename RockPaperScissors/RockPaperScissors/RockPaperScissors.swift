//
//  RockPaperScissors.swift
//  RockPaperScissors
//
//  Created by 지준용 on 2023/09/06.
//

import Foundation

final class RockPaperScissors {
    
    // MARK: - Enum
    
    @frozen
    enum RpsChoice : Int {
        case exit = 0
        case scissors = 1
        case rock = 2
        case paper = 3
        
        static func changeMcpVersion(of choice: RpsChoice) -> RpsChoice {
            switch choice {
            case .exit: return .exit
            case .scissors: return .rock
            case .rock: return .scissors
            case .paper: return .paper
            }
        }
    }
    
    @frozen
    enum GameResult {
        case win
        case lose
        case draw
    }
    
    // MARK: - Property
    
    private var gameResult: GameResult = .draw
    private var userInput = 1
    private var userChoice: RpsChoice = .scissors
    private var firstTurn = ""
    
    // MARK: - Start

    func start() {
        playRPS()
    }

    // MARK: - Play RockPaperScissors
    
    private func playRPS() {
        print(GuideMessage.rpsChoiceMenu, terminator: "")
        
        enterUserChoice(whenMistake: {
            playRPS()
        })
        
        if userInput == 0 {
            return print(GuideMessage.exit)
        }
        
        guard let computerChoice = RpsChoice(rawValue: Int.random(in: 1...3)) else { return }
        gameResult = checkResult(of: userChoice, with: computerChoice) { result in
            print(result)
        }
        
        return playNextGame()
    }
    
    private func playNextGame() {
        switch gameResult {
        case .draw: playRPS()
        default: playMukchippa()
        }
    }
    
    // MARK: - Play Mukchippa
    
    private func playMukchippa() {
        let computerInput = Int.random(in: 1...3)
        
        switch gameResult {
        case .win:
            firstTurn = "사용자"
            
            print(GuideMessage.userTurn)
            print("[사용자 턴] \(GuideMessage.mcpChoiceMenu)", terminator: "")
            
            enterUserChoice(whenMistake: {
                gameResult = .lose
                
                playMukchippa()
            })
            userChoice = RpsChoice.changeMcpVersion(of: userChoice)
            
            if userInput == 0 {
                return print(GuideMessage.exit)
            }
            
            print(GuideMessage.computerTurn)
            print("[컴퓨터 턴] \(GuideMessage.mcpChoiceMenu)\(computerInput)")
            guard let computerChoice = RpsChoice(rawValue: computerInput) else { return }
            gameResult = checkResult(of: userChoice,
                                     with: RpsChoice.changeMcpVersion(of: computerChoice)) { _ in }
            
        case .lose:
            firstTurn = "컴퓨터"
            
            print(GuideMessage.computerTurn)
            print("[컴퓨터 턴] \(GuideMessage.mcpChoiceMenu)\(computerInput)")
            
            print(GuideMessage.userTurn)
            print("[사용자 턴] \(GuideMessage.mcpChoiceMenu)", terminator: "")
            enterUserChoice(whenMistake: {
                playMukchippa()
            })
            userChoice = RpsChoice.changeMcpVersion(of: userChoice)
            
            if userInput == 0 {
                return print(GuideMessage.exit)
            }
            
            guard let computerChoice = RpsChoice(rawValue: computerInput) else { return }
            gameResult = checkResult(of: userChoice,
                                     with: RpsChoice.changeMcpVersion(of: computerChoice)) { _ in }
            
        case .draw:
            return print("\(firstTurn)의 승리!")
        }
        
        return playMukchippa()
    }
    
    // MARK: - Helper Method
    
    private func enterUserChoice(whenMistake: () -> ()) {
        guard let userInput = Int(readLine() ?? "0"),
              let userChoice = RpsChoice(rawValue: userInput) else {
            print(GuideMessage.inputError)
            return whenMistake()
        }
        self.userInput = userInput
        self.userChoice = userChoice
    }
    
    private func checkResult(of userChoice: RpsChoice, with computerChoice: RpsChoice, message: (String) -> ()) -> GameResult {
        switch (userChoice, computerChoice) {
        case (.scissors, .paper), (.rock, .scissors), (.paper, .rock):
            message(GuideMessage.win)
            return .win
        case (.paper, .scissors), (.scissors, .rock), (.rock, .paper):
            message(GuideMessage.lose)
            return .lose
        default:
            message(GuideMessage.draw)
            return .draw
        }
    }
}
