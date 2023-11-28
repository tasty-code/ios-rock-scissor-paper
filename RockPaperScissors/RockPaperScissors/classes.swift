//
//  classes.swift
//  RockPaperScissors
//
//  Created by Kim EenSung on 11/28/23.
//

import Foundation

class InGameMessage {
    static let shared = InGameMessage()
    
    private var inGameMessage: [String : (String) -> String] = [
        "ready,Optional(RockPaperScissors.GameType.rockScissorPaper),nil" : { _ in "가위(1), 바위(2), 보(3)! <종료 : 0> : " },
        "ready,Optional(RockPaperScissors.GameType.mookJjiBba),nil" : { playerName in "[\(playerName) 턴] 묵(1), 찌(2), 빠(3)! <종료 : 0> : " },
        "evaluation,Optional(RockPaperScissors.GameType.rockScissorPaper),Optional(RockPaperScissors.GameResult.win)" : { _ in "이겼습니다!" },
        "evaluation,Optional(RockPaperScissors.GameType.rockScissorPaper),Optional(RockPaperScissors.GameResult.draw)" : { _ in "비겼습니다!" },
        "evaluation,Optional(RockPaperScissors.GameType.rockScissorPaper),Optional(RockPaperScissors.GameResult.lose)" : { _ in "졌습니다!" },
        "evaluation,Optional(RockPaperScissors.GameType.mookJjiBba),nil" : { playerName in "\(playerName)의 턴입니다." },
        "falseInput,nil,nil" : { _ in "잘못된 입력입니다. 다시 시도해주세요." },
        "completed,nil,nil" : { _ in "게임 종료" }
    ]
    
    func printMessage( gameStatus: GameStatus, gameType: GameType? = nil, gameResult: GameResult? = nil, playerName: String = "" ) {
        
        let keyName = "\(gameStatus),\(String(describing: gameType)),\(String(describing: gameResult))"

        if let closure = self.inGameMessage[keyName] {
            print(closure(playerName))
        }
    }
    
    func getInGameMessage() -> [String : (String) -> String] {
        return self.inGameMessage
    }
}
