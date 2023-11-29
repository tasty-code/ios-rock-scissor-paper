//
//  classes.swift
//  RockPaperScissors
//
//  Created by Kim EenSung on 11/28/23.
//

import Foundation

struct GameMaster {
    var gameType: GameType = .rockScissorsPaper
    var user: Player
    var computer: Player
    var turn: Turn = .computer
    
    init(user: Player, computer: Player) {
        self.user = user
        self.computer = computer
    }
    
    mutating func playRockScissorsPaper(userInput: Int) {
        user.chooseRockScissorsPaper(input: userInput)
        computer.chooseRockScissorsPaper(input: Int.random(in: 1...3))
    }
    
    mutating func playMookJjiBba(userInput: Int) {
        user.chooseMookJjiBba(input: userInput)
        computer.chooseMookJjiBba(input: Int.random(in: 1...3))
    }
    
    mutating func evaluateRockScissorsPaper() {
        let userHand = user.retrieveRockScissorsPaper()
        let computerHand = computer.retrieveRockScissorsPaper()
        
        if userHand == computerHand {
            print("비겼습니다.")
            return
        }
        
        switch userHand {
        case .rock:
            self.turn = computerHand == .scissors ? .user : .computer
        case .scissors:
            self.turn = computerHand == .paper ? .user : .computer
        case .paper:
            self.turn = computerHand == .rock ? .user : .computer
        }
        
        if self.turn == .user {
            print("이겼습니다.")
        } else {
            print("졌습니다.")
        }
        self.gameType = .mookJjiBba
    }

    mutating func evaluateMookJjiBba() -> GameResult {
        
        let userHand = user.retrieveMookJjiBba()
        let computerHand = computer.retrieveMookJjiBba()
        
        if userHand == computerHand {
            print("\(self.turn.rawValue)의 승리!")
            return .win
        }
        
        switch userHand {
        case .mook:
            self.turn = computerHand == .jji ? .user : .computer
        case .jji:
            self.turn = computerHand == .bba ? .user : .computer
        case .bba:
            self.turn = computerHand == .mook ? .user : .computer
        }
        print("\(self.turn.rawValue)의 턴입니다.")
        return .draw
    }
    
    mutating func playGame() {
        var userInput: String?
        
        gameLoop : repeat {
            
            print(self.gameType.message(turn: self.turn), terminator: "")
            
            userInput = readLine()
            
            switch userInput {
            case "0":
                break gameLoop
            case "1", "2", "3":
                guard let input = userInput, let intUserInput = Int(input) else {
                    break
                }
                
                switch self.gameType {
                case .rockScissorsPaper:
                    self.playRockScissorsPaper(userInput: intUserInput)
                    self.evaluateRockScissorsPaper()
                
                case .mookJjiBba:
                    self.playMookJjiBba(userInput: intUserInput)
                    let result = self.evaluateMookJjiBba()
                    if result == .win {
                        break gameLoop
                    }
                }
            default :
                self.turn = .computer
                print("잘못된 입력입니다. 다시 시도해주세요.")
            }
        } while userInput != "0"
        
        print("게임 종료")
    }
}
