//
//  enumerations.swift
//  RockPaperScissors
//
//  Created by 박찬호 on 11/27/23.
//

import Foundation

enum GameResult: String {
    case win = "이겼습니다!"
    case draw = "비겼습니다!"
    case lose = "졌습니다!"
}

enum RockScissorPaper: Int {
    case scissor = 1, rock = 2, paper = 3
}

enum MookJjiBba: Int {
    case rock = 1, scissor = 2, paper = 3
}

enum GameType: String {
    case rockScissorPaper = "가위(1), 바위(2), 보(3)! <종료 : 0> : "
    case mookJjiBba = "묵(1), 찌(2), 빠(3)! <종료 : 0> : "
    
    func message(gameType: GameType, turn player: Player) -> String {
        switch gameType {
        case .rockScissorPaper:
            return gameType.rawValue
        case .mookJjiBba:
            return "[\(player.getName()) 턴] " + gameType.rawValue
        }
    }
}

enum InGameMessage {
    case ready, evaluation, falseInput
    
    func message() {
        switch self {
        case .falseInput:
            print("잘못된 입력입니다. 다시 시도해주세요.")
        default:
            print("상태가 정의되지 않았습니다.")
        }
    }
    
    func message(for gameType: GameType, by gameResult: GameResult) {
        switch (gameType, self) {
        case (.rockScissorPaper, .ready):
            print("가위(1), 바위(2), 보(3)! <종료 : 0> : ")
        case (.rockScissorPaper, .evaluation):
            print(gameResult.rawValue)
        default:
            print("상태가 정의되지 않았습니다.")
        }
    }
    
    func message(for gameType: GameType, turn player: Player) {
        switch (gameType, self) {
        case (.mookJjiBba, .ready):
            print("[\(player.getName()) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : ")
        case (.mookJjiBba, .evaluation):
            print("\(player.getName())의 턴입니다.")
        default:
            print("상태가 정의되지 않았습니다.")
        }
    }
}
