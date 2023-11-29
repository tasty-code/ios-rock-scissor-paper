//
//  Display.swift
//  RockPaperScissors
//
//  Created by MAC2020 on 2023/11/23.
//

import Foundation

func displayRockScissorsPaperMenu() {
    print(RockScissorsPaperMessages.Default.menu)
}

func displayMukchippaMenu() {
    print(turnStatus == userTurn ? "\(MukchippaMessages.UserTurn.menu)" : "\(MukchippaMessages.ComputerTurn.menu)")
}
