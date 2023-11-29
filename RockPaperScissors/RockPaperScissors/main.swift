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
    
    mutating func choiceRockScissorsPaperHand() {
        if let input = readLine(),
           let select = RockScissorsPaper(rawValue: input) {
            let playerHand = select
            self.rockScissorsPaperHand = playerHand
        }
    }
    
    mutating func randomRockScissorsPaperHand() {
        let exceptExitCase = RockScissorsPaper.allCases.filter{ $0.rawValue != "0" }
        self.rockScissorsPaperHand = exceptExitCase.randomElement()
    }
    
}

struct Refree {
    func runRockScissorsPaper(playerHand: RockScissorsPaper?, computerHand: RockScissorsPaper?) -> Result {
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
}

func RockScissorsPaperGame(_ userChoice: RockScissorsPaper) -> Bool {
    let userHand = Int(userChoice.rawValue)
    let computerHand = Int.random(in: 1...3)
    if userHand == 0 {
        return true
    } else if computerHand == userHand {
        print("비겼습니다!")
    } else if (computerHand == 1 && userHand == 2) ||
                (computerHand == 2 && userHand == 3) ||
                (computerHand == 3 && userHand == 1)  {
        print("이겼습니다!")
        return true
    }  else {
        print("졌습니다!")
        return true
    }
    return false
}

var onGame: Bool = true

func endGame() {
    onGame.toggle()
}

func startGame() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> :")
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
        print("승리/패배-묵찌빠로")
    }
}

while onGame {
    startGame()
}
