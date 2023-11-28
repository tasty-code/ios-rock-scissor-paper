//
//  enumerations.swift
//  RockPaperScissors
//
//  Created by 박찬호 on 11/27/23.
//

import Foundation

enum GameResult: String {
    case win, draw, lose
}

enum RockScissorPaper: Int {
    case scissor = 1, rock = 2, paper = 3
}

enum MookJjiBba: Int {
    case rock = 1, scissor = 2, paper = 3
}

enum GameType: String {
    case rockScissorPaper, mookJjiBba
}

enum GameStatus {
    case ready, evaluation, falseInput, completed
}
