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

func compareMukchippa(userChoice: RockScissorsPaperCase, computerChoice: RockScissorsPaperCase) {
    switch (userChoice, computerChoice) {
    case (.scissors, .scissors), (.rock, .rock), (.paper, .paper):
        print("비김")
        printWinMessage()
    case (.scissors, .paper), (.rock, .scissors), (.paper, .rock):
        print("사용자가 이김")
        turnStatus = userTurn
        displayMukchippaMenu()
    case (.paper, .scissors), (.scissors, .rock), (.rock, .paper):
        print("컴퓨터가 이김")
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
