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

enum RockScissorsPaper: Int {
    case scissors = 1, rock = 2, paper = 3
}

enum MookJjiBba: Int {
    case mook = 1, jji = 2, bba = 3
}

enum GameType: String {
    case rockScissorsPaper, mookJjiBba
}

enum GameStatus {
    case ready, evaluation, falseInput, completed
}
