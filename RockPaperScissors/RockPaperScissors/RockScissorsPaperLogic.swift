//
//  RockScissorsPaperLogic.swift
//  RockPaperScissors
//
//  Created by MAC2020 on 2023/11/23.
//

import Foundation

func initPlayRockScissorsPaperGame() {
    displayRockScissorsPaperMenu()
    userInputReadLine()
}

private func getComputerRandomNumber() -> Int {
    return Int.random(in: 1 ... 3)
}

private func userInputReadLine() {
    while isWorkingRockScissorsPaper {
        let randomValue = getComputerRandomNumber()
        guard let inputValue = readLine() else { return }
        if let userInputNum = Int(inputValue), userInputNum >= 1 && userInputNum <= 3 {
            compareRockScissorsPaper(userChoice: RockScissorsPaperCase(rawValue:userInputNum)!, computerChoice: RockScissorsPaperCase(rawValue:randomValue)!)
        } else if let userInputNum = Int(inputValue), userInputNum == 0 {
            print(StringNameSpace.endMessage.rawValue)
            isWorkingRockScissorsPaper = false
        } else {
            print(StringNameSpace.inputErrorMessage.rawValue)
        }
    }
}

private func compareRockScissorsPaper(userChoice: RockScissorsPaperCase, computerChoice: RockScissorsPaperCase) {
    switch (userChoice, computerChoice) {
    case (.scissors, .paper), (.rock, .scissors), (.paper, .rock):
        print(StringNameSpace.winMessage.rawValue)
        print(StringNameSpace.endMessage.rawValue)
        isWorkingRockScissorsPaper = false
    case (.paper, .scissors), (.scissors, .rock), (.rock, .paper):
        print(StringNameSpace.loseMessage.rawValue)
        print(StringNameSpace.endMessage.rawValue)
        isWorkingRockScissorsPaper = false
    default:
        print(StringNameSpace.drawMessage.rawValue)
        displayRockScissorsPaperMenu()
    }
}


