//
//  PrintStringConstatnt.swift
//  RockPaperScissors
//
//  Created by Taewan Kim on 11/30/23.
//

import Foundation

enum StringConstants {
    enum Common {
        static let emptyInput = "입력값이 없습니다. 다시 시도하세요."
        static let wrongInput = "잘못된 입력입니다. 1, 2, 3, 0 중 하나를 입력하세요."
    }
    
    enum RockScissorsPaper {
        static let mainQuestion = "가위(1), 바위(2), 보(3)! <종료 : 0> : "
        static let winRockScissorsPaper = "\(RockScissorsPaperResult.win)!"
        static let loseRockScissorsPaper = "\(RockScissorsPaperResult.lose)!"
        static let drawRockScissorsPaper = "\(RockScissorsPaperResult.draw)!"
    }
    
    enum MukJjiBba {
        static let playerTurnMainQuestion = "[\(WinningTurn.playerTurn) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> :"
        static let computerTurnMainQuestion = "[\(WinningTurn.computerTurn) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> :"
        static let playerTurn = "\(MukJjiBbaResult.playerTurn)"
        static let computerTurn = "\(MukJjiBbaResult.computerTurn)"
    }
}
