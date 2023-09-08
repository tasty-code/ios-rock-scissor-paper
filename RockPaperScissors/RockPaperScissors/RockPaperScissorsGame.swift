//
//  RockPaperScissorsGame.swift
//  RockPaperScissors
//
//  Created by JaeHyeok Sim on 2023/09/07.
//

import Foundation

struct RockPaperScissorsGame {
    private var turnOwner = true
    private var ownerName: String {
        get {
            turnOwner ? "사용자" : "컴퓨터"
        }
    }
    private var battleResultType: BattleResult = .draw
    
    mutating func playMukJjiPpa() {
        do {
            try doRockPaperScissors()
            try doMukJjiPpa()
        } catch PlayingGameException.zeroExit {
            print("게임 종료.")
        } catch {
            print("오류가 발생했습니다.")
        }
    }
    
    private func getPlayerHandType() throws -> Int {
        let playerInput = readLine() ?? "error"
        guard let playerHandType = Int(playerInput), (0...3).contains(playerHandType) else {
            throw PlayingGameException.invalidInputError
        }
        
        if playerHandType == 0 {
            throw PlayingGameException.zeroExit
        }
        
        return playerHandType
    }
    
    private func getRandomHandType() throws -> Int {
        guard let randomHandType = (1...3).randomElement() else {
            throw PlayingGameException.unknownError
        }
        return randomHandType
    }
    
    private func battle(_ player1HandType: Int, and player2HandType: Int) throws -> BattleResult {
        guard let player1HandShape = RockPaperScissors(rawValue: player1HandType), let player2HandShape = RockPaperScissors(rawValue: player2HandType) else {
            throw PlayingGameException.invalidInputError
        }
        
        if player1HandShape == player2HandShape {
            return .draw
        } else if player2HandShape < player1HandShape {
            return .player1Win
        } else {
            return .player2Win
        }
    }
    
    private mutating func doRockPaperScissors() throws {
        while true {
            print("가위(1), 바위(2), 보(3)! <종료: 0> : ", terminator: "")
            
            do {
                let playerHandType = try getPlayerHandType()
                let computerHandType = try getRandomHandType()
                battleResultType = try battle(playerHandType, and: computerHandType)
            } catch PlayingGameException.invalidInputError {
                print("잘못된 입력입니다. 다시 시도해주세요.")
            } catch {
                throw error
            }
            
            print(battleResultType.getResultString())
            
            switch battleResultType {
            case .player1Win:
                turnOwner = true
                return
            case .player2Win:
                turnOwner = false
                return
            case .draw:
                continue
            }
        }
    }
    
    private mutating func doMukJjiPpa() throws {
        while true {
            print("[\(ownerName) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ", terminator: "")
            
            do {
                let playerHandType = try getPlayerHandType()
                let computerHandType = try getRandomHandType()
                battleResultType = try battle(playerHandType, and: computerHandType)
            } catch PlayingGameException.invalidInputError {
                print("잘못된 입력입니다. 다시 시도해주세요.")
                battleResultType = .player2Win
            } catch {
                throw error
            }
            
            switch battleResultType {
            case .player1Win:
                turnOwner = true
            case .player2Win:
                turnOwner = false
            case .draw:
                print("\(ownerName) 승리!")
                return
            }
            
            print("\(ownerName)의 턴입니다.")
        }
    }
}
