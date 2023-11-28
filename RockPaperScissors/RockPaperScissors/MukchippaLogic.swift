//
//  MukchippaLogic.swift
//  RockPaperScissors
//
//  Created by MAC2020 on 2023/11/28.
//

import Foundation

var isWorkingMukchippa = false
var turnStatus = true
let computerTurn = false
let userTurn = true

func compareMukchippa(userInputNumber: RockScissorsPaperCase, computerInputNumber: RockScissorsPaperCase) {
    switch (userInputNumber, computerInputNumber) {
    case (.scissors, .scissors), (.rock, .rock), (.paper, .paper):
        printWinMessage()
        isWorkingRockScissorsPaper = false
    case (.scissors, .paper), (.rock, .scissors), (.paper, .rock):
        turnStatus = userTurn
        displayMukchippaMenu()
    case (.paper, .scissors), (.scissors, .rock), (.rock, .paper):
        turnStatus = computerTurn
        displayMukchippaMenu()
    }
}

func printWinMessage() {
    print(turnStatus == userTurn ? "\(MukchippaMessages.UserTurn.win)" : "\(MukchippaMessages.ComputerTurn.win)")
}

func displayMukchippaMenu() {
    print(turnStatus == userTurn ? "\(MukchippaMessages.UserTurn.menu)" : "\(MukchippaMessages.ComputerTurn.menu)")
}
