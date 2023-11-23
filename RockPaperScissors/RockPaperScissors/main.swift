//
//  RockPaperScissors - main.swift
//  Created by tacocat.
//  Copyright © tastycode. All rights reserved.
// 

import Foundation

enum RockScissorsPaperCase: Int {
    case scissors = 1, rock, paper
}

enum StringNameSpace: String {
    case winMessage = "이겼습니다."
    case loseMessage = "졌습니다."
    case drawMessage = "비겼습니다."
    case endMessage = "게임 종료"
    case inputErrorMessage = "잘못된 입력입니다. 다시 시도해주세요."
    case rockScissorsPaperExit = "가위(1), 바위(2) 보(3)! <종료: 0>"
}

var isPlayRockScissorsPaperGame = true

initPlayRockScissorsPaperGame()

// MARK: - Function
func displayRockScissorsPaperMenu() {
    print(StringNameSpace.rockScissorsPaperExit.rawValue)
}

private func comRandomInput() -> Int {
    return Int.random(in: 1 ... 3)
}

private func compareRockScissorsPaper(user: RockScissorsPaperCase, com: RockScissorsPaperCase) {
    switch (user, com) {
    case (.scissors, .paper), (.rock, .scissors), (.paper, .rock):
        print(StringNameSpace.winMessage.rawValue)
        print(StringNameSpace.endMessage.rawValue)
        isPlayRockScissorsPaperGame = false
    case (.paper, .scissors), (.scissors, .rock), (.rock, .paper):
        print(StringNameSpace.loseMessage.rawValue)
        print(StringNameSpace.endMessage.rawValue)
        isPlayRockScissorsPaperGame = false
    default:
        print(StringNameSpace.drawMessage.rawValue)
        displayRockScissorsPaperMenu()
    }
}

private func userInput() {
    while isPlayRockScissorsPaperGame {
        let randomValue = comRandomInput()
        guard let inputValue = readLine() else { return }
        if let num = Int(inputValue), num >= 1 && num <= 3 {
            compareRockScissorsPaper(user: RockScissorsPaperCase(rawValue:num)!, com: RockScissorsPaperCase(rawValue:randomValue)!)
        } else if let num = Int(inputValue) , num == 0 {
            print(StringNameSpace.endMessage)
            isPlayRockScissorsPaperGame = false
        } else {
            print(StringNameSpace.inputErrorMessage.rawValue)
        }
    }
}

func initPlayRockScissorsPaperGame() {
    displayRockScissorsPaperMenu()
    userInput()
}
