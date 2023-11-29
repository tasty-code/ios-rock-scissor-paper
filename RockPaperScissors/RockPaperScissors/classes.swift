//
//  classes.swift
//  RockPaperScissors
//
//  Created by Kim EenSung on 11/28/23.
//

import Foundation

class InGameMessage {
    static let shared = InGameMessage()
    
    private var message: [String : (String) -> String] = [
        "ready,Optional(RockPaperScissors.GameType.rockScissorsPaper),nil" : { _ in "가위(1), 바위(2), 보(3)! <종료 : 0> : " },
        "ready,Optional(RockPaperScissors.GameType.mookJjiBba),nil" : { playerName in "[\(playerName) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : " },
        
        "evaluation,Optional(RockPaperScissors.GameType.rockScissorsPaper),Optional(RockPaperScissors.GameResult.win)" : { _ in "이겼습니다!" },
        "evaluation,Optional(RockPaperScissors.GameType.rockScissorsPaper),Optional(RockPaperScissors.GameResult.draw)" : { _ in "비겼습니다!" },
        "evaluation,Optional(RockPaperScissors.GameType.rockScissorsPaper),Optional(RockPaperScissors.GameResult.lose)" : { _ in "졌습니다!" },
        "evaluation,Optional(RockPaperScissors.GameType.mookJjiBba),Optional(RockPaperScissors.GameResult.draw)" : { playerName in "\(playerName)의 턴입니다." },
        
        "falseInput,nil,nil" : { _ in "잘못된 입력입니다. 다시 시도해주세요." },
        "completed,nil,nil" : { playerName in "\(playerName)의 승리!" }
    ]
    
    func print( status: GameStatus, type: GameType? = nil, result: GameResult? = nil, playerName: String = "" ) {
        
        let keyName = "\(status),\(String(describing: type)),\(String(describing: result))"

        guard let closure = self.message[keyName] else {
            return
        }
        
        if status == .ready {
            Swift.print(closure(playerName), terminator: "")
        } else {
            Swift.print(closure(playerName))
        }
    }
}

struct GameMaster {
    private var gameType: GameType
    var user: Player
    var computer: Player
    private var turn: Player
    private var message = InGameMessage.shared
    
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
            self.message.print(status: .evaluation, type: .rockScissorsPaper, result: .draw)
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
            self.message.print(status: .evaluation, type: .rockScissorsPaper, result: .win)
        } else {
            self.message.print(status: .evaluation, type: .rockScissorsPaper, result: .lose)
        }
        self.gameType = .mookJjiBba
    }

    mutating func evaluateMookJjiBba() -> GameResult {
        if self.user.getMookJjiBba() == self.computer.getMookJjiBba() {
            self.message.print(status: .evaluation, type: .mookJjiBba, result: .win)
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
        self.message.print(status: .evaluation, type: .mookJjiBba, result: .draw, playerName: self.turn.getName())
        return .draw
    }
    
    mutating func playGame() {
        var userInput: String?
        
        gameLoop : repeat {
            self.message.print(status: .ready, type: self.gameType, playerName: self.turn.getName())
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
                self.message.print(status: .falseInput)
            }
        } while userInput != "0"
        
        self.message.print(status: .completed, playerName: self.turn.getName())
    }
}
