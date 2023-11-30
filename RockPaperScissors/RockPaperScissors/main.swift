//
//  RockPaperScissors - main.swift
//  Created by tacocat.
//  Copyright © tastycode. All rights reserved.
//

import Foundation

enum RockScissorsPaper: String, CaseIterable {
    case exit = "0"
    case scissors = "1"
    case rock = "2"
    case paper = "3"
}

enum MukJiPa: String, CaseIterable {
    case exit = "0"
    case muk = "1"
    case ji = "2"
    case pa = "3"
}

enum Result: String {
    case exit, win, draw, lose
}

struct Player {
    var rockScissorsPaperHand: RockScissorsPaper?
    var mukJiPaHand: MukJiPa?
    
    mutating func choiceRockScissorsPaperHand() {
        if let input = readLine(),
           let select = RockScissorsPaper(rawValue: input) {
            let playerHand = select
            self.rockScissorsPaperHand = playerHand
        } else {
            print("잘못된 입력입니다. 다시 시도해주세요")
            choiceRockScissorsPaperHand()
            return
        }
    }
    
    mutating func randomRockScissorsPaperHand() {
        let exceptExitCase = RockScissorsPaper.allCases.filter { $0.rawValue != "0" }
        self.rockScissorsPaperHand = exceptExitCase.randomElement()
    }
    
    mutating func choiceMukJiPaHand() {
        if let input = readLine(),
           let select = MukJiPa(rawValue: input) {
            let playerHand = select
            self.mukJiPaHand = playerHand
        }
    }
    
    mutating func randomMukJiPaHand() {
        let exceptExitCase = MukJiPa.allCases.filter { $0.rawValue != "0" }
        self.mukJiPaHand = exceptExitCase.randomElement()
    }
}

struct Refree {
    func runRockScissorsPaper(playerHand: RockScissorsPaper?,
                              computerHand: RockScissorsPaper?) -> Result {
        if playerHand == .exit {
            return Result.exit
        } else {
            if playerHand == computerHand {
                return Result.draw
            } else if (playerHand == .rock && computerHand == .scissors) ||
                        (playerHand == .scissors && computerHand == .paper) ||
                        (playerHand == .paper && computerHand == .rock) {
                return Result.win
            } else {
                return Result.lose
            }
        }
    }
    
    func noticeRockScissorPaperResult(_ rockScissorsPaperResult: Result) {
        switch rockScissorsPaperResult {
        case .win:
            print("이겼습니다!")
        case .lose:
            print("졌습니다!")
        case .draw:
            print("error: 00")
        case .exit:
            print("error: 01")
        }
    }
    
    func runMukJiPa(rockScissorsPaperResult: Result, user: Player, computer: Player) {
        var shadowUser = user
        var shadowComputer = computer
        // print("\(rockScissorsPaperResult)")
        
        if rockScissorsPaperResult == Result.win {
            print("[사용자 턴] 묵(1) 찌(2) 빠(3)! <종료 : 0> : ", terminator: "")
        } else if rockScissorsPaperResult == Result.lose {
            print("[컴퓨터 턴] 묵(1) 찌(2) 빠(3)! <종료 : 0> : ", terminator: "")
        } else {
            print("error: 02")
            exit(0)
        }
        
        shadowUser.choiceMukJiPaHand()
        shadowComputer.randomMukJiPaHand()

        if shadowUser.mukJiPaHand == shadowComputer.mukJiPaHand {
            print("\(shadowUser.mukJiPaHand!), \(shadowComputer.mukJiPaHand!)")
            if rockScissorsPaperResult == Result.win {
                print("사용자 승리")
                endGame()
            } else {
                print("컴퓨터 승리")
                endGame()
            }
        } else if (shadowUser.mukJiPaHand == .muk && shadowComputer.mukJiPaHand == .ji) ||
                    (shadowUser.mukJiPaHand == .ji && shadowComputer.mukJiPaHand == .pa) ||
                    (shadowUser.mukJiPaHand == .pa && shadowComputer.mukJiPaHand == .muk) {
            print("\(shadowUser.mukJiPaHand!), \(shadowComputer.mukJiPaHand!)")
            runMukJiPa(rockScissorsPaperResult: Result.win, user: shadowUser, computer: shadowComputer)
        } else if (shadowUser.mukJiPaHand == .ji && shadowComputer.mukJiPaHand == .muk) ||
                    (shadowUser.mukJiPaHand == .pa && shadowComputer.mukJiPaHand == .ji) ||
                    (shadowUser.mukJiPaHand == .muk && shadowComputer.mukJiPaHand == .pa) {
            print("\(shadowUser.mukJiPaHand!), \(shadowComputer.mukJiPaHand!)")
            runMukJiPa(rockScissorsPaperResult: Result.lose, user: shadowUser, computer: shadowComputer)
        } else if shadowUser.mukJiPaHand == nil {
            print("잘못된 입력, 턴이 넘어갑니다.")
            runMukJiPa(rockScissorsPaperResult: Result.lose, user: shadowUser, computer: shadowComputer)
        } else {
            endGame()
        }
        
    }
}

var onGame: Bool = true

func endGame() {
    onGame.toggle()
}

func startGame() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> : ", terminator: "")
    let refree = Refree()
    var user = Player()
    var computer = Player()
    
    user.choiceRockScissorsPaperHand()
    computer.randomRockScissorsPaperHand()
    
    let rockScissorPaperResult = refree.runRockScissorsPaper(playerHand: user.rockScissorsPaperHand,
                                                             computerHand: computer.rockScissorsPaperHand)
    
    switch rockScissorPaperResult {
    case .exit:
        endGame()
    case .draw:
        print("비겼습니다!")
        startGame()
        return
    default:
        print("\(rockScissorPaperResult), 묵찌빠로")
        refree.runMukJiPa(rockScissorsPaperResult: rockScissorPaperResult, user: user, computer: computer)
        
    }
}

while onGame {
    startGame()
}
