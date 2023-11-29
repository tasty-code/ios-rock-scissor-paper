//
//  classes.swift
//  RockPaperScissors
//
//  Created by Kim EenSung on 11/28/23.
//

import Foundation

struct GameMaster {
    private var gameType: GameType
    var user: Player
    var computer: Player
    private var turn: Player
    
    init(gameType: GameType, user: Player, computer: Player, turn: Player) {
        self.gameType = gameType
        self.user = user
        self.computer = computer
        self.turn = turn
    }
    
    mutating func playRockScissorsPaper(userInput: Int) {
        user.setRockScissorsPaper(input: userInput)
        computer.setRockScissorsPaper(input: Int.random(in: 1...3))
    }
    
    mutating func playMookJjiBba(userInput: Int) {
        user.setMookJjiBba(input: userInput)
        computer.setMookJjiBba(input: Int.random(in: 1...3))
    }
    
    mutating func evaluateRockScissorsPaper() {
        if self.user.getRockScissorsPaper() == self.computer.getRockScissorsPaper() {
            print("비겼습니다.")
            return
        }
        
        switch user.getRockScissorsPaper() {
        case .rock:
            self.turn = computer.getRockScissorsPaper() == .scissors ? user : computer
        case .scissors:
            self.turn = computer.getRockScissorsPaper() == .paper ? user : computer
        case .paper:
            self.turn = computer.getRockScissorsPaper() == .rock ? user : computer
        }
        
        if self.turn.getName() == "사용자" {
            print("이겼습니다.")
        } else {
            print("졌습니다.")
        }
        self.gameType = .mookJjiBba
    }

    mutating func evaluateMookJjiBba() -> GameResult {
        if self.user.getMookJjiBba() == self.computer.getMookJjiBba() {
            print("\(self.turn.getName())의 승리!")
            return .win
        }
        
        switch user.getMookJjiBba() {
        case .mook:
            self.turn = computer.getMookJjiBba() == .jji ? user : computer
        case .jji:
            self.turn = computer.getMookJjiBba() == .bba ? user : computer
        case .bba:
            self.turn = computer.getMookJjiBba() == .mook ? user : computer
        }
        print("\(self.turn.getName())의 턴입니다.")
        return .draw
    }
    
    mutating func playGame() {
        var userInput: String?
        
        gameLoop : repeat {
            
            switch self.gameType {
            case .mookJjiBba:
                print("[\(self.turn.getName()) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
            case .rockScissorsPaper:
                print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
            
            }
            
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
                self.turn = computer
                print("잘못된 입력입니다. 다시 시도해주세요.")
            }
        } while userInput != "0"
        
        print("게임 종료")
    }
}
