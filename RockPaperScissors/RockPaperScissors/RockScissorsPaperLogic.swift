//
//  RockScissorsPaperLogic.swift
//  RockPaperScissors
//
//  Created by MAC2020 on 2023/11/23.
//

import Foundation

func initPlayRockScissorsPaperGame() {
    displayRockScissorsPaperMenu()
    userInput()
}

private func getComputerRandomNumber() -> Int {
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
        let randomValue = getComputerRandomNumber()
        guard let inputValue = readLine() else { return }
        if let num = Int(inputValue), num >= 1 && num <= 3 {
            compareRockScissorsPaper(user: RockScissorsPaperCase(rawValue:num)!, com: RockScissorsPaperCase(rawValue:randomValue)!)
        } else if let num = Int(inputValue), num == 0 {
            print(StringNameSpace.endMessage.rawValue)
            isPlayRockScissorsPaperGame = false
        } else {
            print(StringNameSpace.inputErrorMessage.rawValue)
        }
    }
}
