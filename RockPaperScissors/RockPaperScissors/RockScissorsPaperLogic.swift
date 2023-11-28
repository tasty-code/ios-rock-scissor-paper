//
//  RockScissorsPaperLogic.swift
//  RockPaperScissors
//
//  Created by MAC2020 on 2023/11/23.
//

import Foundation

var isWorkingRockScissorsPaper = true

func initPlayRockScissorsPaperGame() {
    displayRockScissorsPaperMenu()
    userInputReadLine()
}

private func getComputerRandomNumber() -> Int {
    return Int.random(in: 1 ... 3)
}

private func userInputReadLine() {
    while isWorkingRockScissorsPaper {
        let computerRandomNum = getComputerRandomNumber()
        let inputNum = readLine()
        guard let input = inputNum, let userInputNum = Int(input), userInputNum > -1 && userInputNum < 4 else {
            print(ErrorMessages.inputError)
            displayRockScissorsPaperMenu()
            continue
        }
        guard userInputNum != 0 else {
            return print(EndGameMessages.endMessage)
        }
        compareRockScissorsPaper(userInputNumber: RockScissorsPaperCase(rawValue:userInputNum)!, computerInputNumber: RockScissorsPaperCase(rawValue:computerRandomNum)!)
    }
}

private func compareRockScissorsPaper(userInputNumber: RockScissorsPaperCase, computerInputNumber: RockScissorsPaperCase) {
    switch (userInputNumber, computerInputNumber) {
    case (.scissors, .paper), (.rock, .scissors), (.paper, .rock):
        print(RockScissorsPaperMessages.Results.win)
        print(EndGameMessages.endMessage)
        isWorkingRockScissorsPaper = false
    case (.paper, .scissors), (.scissors, .rock), (.rock, .paper):
        print(RockScissorsPaperMessages.Results.lose)
        print(EndGameMessages.endMessage)
        isWorkingRockScissorsPaper = false
    default:
        print(RockScissorsPaperMessages.Results.draw)
        displayRockScissorsPaperMenu()
    }
}


