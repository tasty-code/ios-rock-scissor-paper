//
//  MukchippaLogic.swift
//  RockPaperScissors
//
//  Created by MAC2020 on 2023/11/28.
//

import Foundation

var isWorkingMukchippa = false
var isWhoTurn = true
let isComputerTurn = false
let isUserTurn = true

func compareMukchippa(userInputNumber: RockScissorsPaperCase, computerInputNumber: RockScissorsPaperCase) {
    switch (userInputNumber, computerInputNumber) {
    case (.scissors, .scissors), (.rock, .rock), (.paper, .paper):
        printWinMessage()
        isWorkingRockScissorsPaper = false
    case (.scissors, .paper), (.rock, .scissors), (.paper, .rock):
        isWhoTurn = isUserTurn
        displayMukchippaMenu()
    case (.paper, .scissors), (.scissors, .rock), (.rock, .paper):
        isWhoTurn = isComputerTurn
        displayMukchippaMenu()
    }
}

func printWinMessage() {
    print(isWhoTurn == isUserTurn ? "\(MukchippaMessages.UserTurn.win)" : "\(MukchippaMessages.ComputerTurn.win)")
}
