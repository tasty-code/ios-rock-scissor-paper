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
                    let rockScissorsPaper = RockScissorsPaper()
                    let (result, turn) = rockScissorsPaper.play(user: self.user, computer: self.computer, userInput: intUserInput)
                    if result == .draw {
                        break
                    }
                    self.turn = turn
                    self.gameType = .mookJjiBba
                    
                case .mookJjiBba:
                    let mookJjiBba = MookJjiBba()
                    let (result, turn) = mookJjiBba.play(user: self.user, computer: self.computer, turn: self.turn, userInput: intUserInput)
                    self.turn = turn
                    
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
