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
        } else {
            print("잘못된 입력입니다. 다시 시도해주세요")
            choiceRockScissorsPaperHand()
            return
        }
    }
    
    mutating func randomRockScissorsPaperHand() {
        let exceptExitCase = RockScissorsPaper.allCases.filter{ $0.rawValue != "0" }
        self.rockScissorsPaperHand = exceptExitCase.randomElement()
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
}

var onGame: Bool = true

func endGame() {
    onGame.toggle()
}

func startGame() {
    print("가위(1), 바위(2), 보(3)! <종료 : 0> :", terminator: "")
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
    }
}

while onGame {
    startGame()
}
