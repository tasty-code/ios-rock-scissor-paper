//
//  RockPaperScissors - main.swift
//  Created by tacocat.
//  Copyright © tastycode. All rights reserved.
// 

import Foundation

enum RpsCase: Int {
    case scissors = 1
    case rock
    case paper
}

var isPlayRockScissorsPaperGame = true


userInput()


// MARK: - Function
func displayRockScissorsPaperMenu() {
    print("가위(1), 바위(2) 보(3)! <종료: 0>")
}

func comRandomInput() -> Int {
    return Int.random(in: 1 ... 3)
}

func compareRockScissorsPaper(user: RpsCase, com: RpsCase) {
    switch (user, com) {
    case (.scissors, .paper), (.rock, .scissors), (.paper, .rock):
        print("이겼습니다.")
        print("게임 종료")
        isPlayRockScissorsPaperGame = false
    case (.paper, .scissors), (.scissors, .rock), (.rock, .paper):
        print("졌습니다.")
        print("게임 종료")
        isPlayRockScissorsPaperGame = false
    default:
        print("비겼습니다.")
        displayRockScissorsPaperMenu()
    }
}


func userInput() {
    while isPlayRockScissorsPaperGame {
        let randomValue = comRandomInput()
        guard let inputValue = readLine() else { return }
        if let num = Int(inputValue), num >= 1 && num <= 3 {
            compareRockScissorsPaper(user: RpsCase(rawValue:num)!, com: RpsCase(rawValue:randomValue)!)
        } else if let num = Int(inputValue) , num == 0 {
            print("게임 종료")
            isPlayRockScissorsPaperGame = false
        } else {
            print("잘못된 입력입니다. 다시 시도해주세요.")
        }
    }
}

func initPlayRockScissorsPaperGame() {
    displayRockScissorsPaperMenu()
    while isPlayRockScissorsPaperGame {
        userInput()
    }
}
