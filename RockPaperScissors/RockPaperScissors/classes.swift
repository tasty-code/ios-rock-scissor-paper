//
//  classes.swift
//  RockPaperScissors
//
//  Created by Kim EenSung on 11/28/23.
//

import Foundation

class InGameMessage {
    static let shared = InGameMessage()
    
    private var inGameMessage: [String : (String) -> String] = [
        "ready,Optional(RockPaperScissors.GameType.rockScissorPaper),nil" : { _ in "가위(1), 바위(2), 보(3)! <종료 : 0> : " },
        "ready,Optional(RockPaperScissors.GameType.mookJjiBba),nil" : { playerName in "[\(playerName) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : " },
        
        "evaluation,Optional(RockPaperScissors.GameType.rockScissorPaper),Optional(RockPaperScissors.GameResult.win)" : { _ in "이겼습니다!" },
        "evaluation,Optional(RockPaperScissors.GameType.rockScissorPaper),Optional(RockPaperScissors.GameResult.draw)" : { _ in "비겼습니다!" },
        "evaluation,Optional(RockPaperScissors.GameType.rockScissorPaper),Optional(RockPaperScissors.GameResult.lose)" : { _ in "졌습니다!" },
        "evaluation,Optional(RockPaperScissors.GameType.mookJjiBba),Optional(RockPaperScissors.GameResult.draw)" : { playerName in "\(playerName)의 턴입니다." },
        
        "falseInput,nil,nil" : { _ in "잘못된 입력입니다. 다시 시도해주세요." },
        "completed,nil,nil" : { playerName in "\(playerName)의 승리!" }
    ]
    
    func printMessage( gameStatus: GameStatus, gameType: GameType? = nil, gameResult: GameResult? = nil, playerName: String = "" ) {
        
        let keyName = "\(gameStatus),\(String(describing: gameType)),\(String(describing: gameResult))"

        guard let closure = self.inGameMessage[keyName] else {
            return
        }
        
        if gameStatus == .ready {
            print(closure(playerName), terminator: "")
        } else {
            print(closure(playerName))
        }
    }
    
    func getInGameMessage() -> [String : (String) -> String] {
        return self.inGameMessage
    }
}

class GameMaster {
    private var gameType: GameType
    private var user: Player
    private var computer: Player
    private var turn: Player
    private var inGameMessage = InGameMessage.shared
    
    init(gameType: GameType, user: Player, computer: Player, turn: Player) {
        self.gameType = gameType
        self.user = user
        self.computer = computer
        self.turn = turn
    }
    
    func getGameType() -> GameType {
        return self.gameType
    }
    
    func setGameType(to gameType: GameType) {
        self.gameType = gameType
    }
    
    func getUser() -> Player {
        return self.user
    }
    
    func getComputer() -> Player {
        return self.computer
    }
    
    func getTurn() -> Player {
        return self.turn
    }
    
    func setTurn(to player: Player) {
        self.turn = player
    }
    
    func playRockScissorPaper(userInput: Int) {
        user.setRockScissorPaper(input: userInput)
        computer.setRockScissorPaper(input: Int.random(in: 1...3))
    }
    
    func playMookJjiBba(userInput: Int) {
        user.setMookJjiBba(input: userInput)
        computer.setMookJjiBba(input: Int.random(in: 1...3))
    }
    
    func evaluateRockScissorPaper() {
        if self.user.getRockScissorPaper() == self.computer.getRockScissorPaper() {
            self.inGameMessage.printMessage(gameStatus: .evaluation, gameType: .rockScissorPaper, gameResult: .draw)
            return
        }
        
        switch user.getRockScissorPaper() {
        case .rock:
            self.turn = computer.getRockScissorPaper() == .scissor ? user : computer
        case .scissor:
            self.turn = computer.getRockScissorPaper() == .paper ? user : computer
        case .paper:
            self.turn = computer.getRockScissorPaper() == .rock ? user : computer
        }
        
        if self.turn.getName() == "사용자" {
            self.inGameMessage.printMessage(gameStatus: .evaluation, gameType: .rockScissorPaper, gameResult: .win)
        } else {
            self.inGameMessage.printMessage(gameStatus: .evaluation, gameType: .rockScissorPaper, gameResult: .lose)
        }
        self.gameType = .mookJjiBba
    }

    func evaluateMookJjiBba() -> GameResult {
        if self.user.getMookJjiBba() == self.computer.getMookJjiBba() {
            self.inGameMessage.printMessage(gameStatus: .evaluation, gameType: .mookJjiBba, gameResult: .win)
            return .win
        }
        
        switch user.getMookJjiBba() {
        case .rock:
            self.turn = computer.getMookJjiBba() == .scissor ? user : computer
        case .scissor:
            self.turn = computer.getMookJjiBba() == .paper ? user : computer
        case .paper:
            self.turn = computer.getMookJjiBba() == .rock ? user : computer
        }
        self.inGameMessage.printMessage(gameStatus: .evaluation, gameType: .mookJjiBba, gameResult: .draw, playerName: self.turn.getName())
        return .draw
    }
    
    func playGame() {
        var userInput: String?
        
        gameLoop : repeat {
            self.inGameMessage.printMessage(gameStatus: .ready, gameType: self.gameType, playerName: self.turn.getName())
            userInput = readLine()
            
            switch userInput {
            case "0":
                break gameLoop
            case "1", "2", "3":
                guard let input = userInput, let intUserInput = Int(input) else {
                    break
                }
                
                switch self.getGameType() {
                case .rockScissorPaper:
                    self.playRockScissorPaper(userInput: intUserInput)
                    self.evaluateRockScissorPaper()
                
                case .mookJjiBba:
                    self.playMookJjiBba(userInput: intUserInput)
                    let result = self.evaluateMookJjiBba()
                    if result == .win {
                        break gameLoop
                    }
                }
            default :
                self.setTurn(to: computer)
                self.inGameMessage.printMessage(gameStatus: .falseInput)
            }
        } while userInput != "0"
        
        self.inGameMessage.printMessage(gameStatus: .completed, playerName: self.turn.getName())
    }
}
