//
//  RockPaperScissors - main.swift
//  Created by mireu & kyle.
//  Copyright © tastycode. All rights reserved.
//

struct RockScissorPaper {
    private let opponentHands: [Int] = [1, 2, 3]
    private var isRunning: Bool = true

    mutating func choiceRockScissorsPaper() {
        while isRunning {
            let computer = checkingOpponentHand()
            
            print("가위(1), 바위(2), 보(3)! <종료: 0> :", terminator: " ")
            guard
                let input = readLine(),
                let user = Int(input)
            else {
                print("잘못된 입력입니다. 다시 시도해주세요.")
                continue
            }
            checkingResult(user: user, computer: computer)
            
        }
    }

    private func checkingOpponentHand() -> Int {
        guard
            let opponentHand = opponentHands.randomElement()
        else {
            return 0
        }
        
        return opponentHand
    }

    private mutating func playGame(user: Choice, computer: Choice) {
        switch (user, computer) {
        case (.scissor,.rock),(.rock,.paper),(.paper,.scissor):
            print("졌습니다!")
            print("게임종료")
            isRunning = false
        case (.scissor,.paper),(.rock,.scissor),(.paper,.rock):
            print("이겼습니다!")
            print("게임종료")
            isRunning = false
        default:
            print("비겼습니다!")
            choiceRockScissorsPaper()
        }
    }
    
    private mutating func checkingResult(user: Int, computer: Int) {
        while isRunning {
            guard
                let userChoice = Choice(rawValue: user),
                let computerChoice = Choice(rawValue: computer)
            else {
                print("잘못된 입력입니다. 다시 시도해주세요.")
                return choiceRockScissorsPaper()
            }
            
            switch user {
            case 0:
                print("게임종료")
                return
            case 1...3:
                playGame(user: userChoice, computer: computerChoice)
            default:
                print("잘못된 입력입니다. 다시 시도해주세요.")
                continue
            }
        }
    }
}

var rockScissorPaper = RockScissorPaper()
rockScissorPaper.choiceRockScissorsPaper()
