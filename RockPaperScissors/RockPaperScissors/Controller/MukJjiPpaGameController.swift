//
//  MukJjiPpaGameController.swift
//  RockPaperScissors
//
//  Created by misung & UngQ on 11/29/23.
//

class MukJjiPpaGameController {
    private let mukJjiPpaGame: MukJjiPpaGame
    
    init(mukJjiPpaGame: MukJjiPpaGame) {
        self.mukJjiPpaGame = mukJjiPpaGame
    }
    
    func printMenuMessage() {
        let whosTurn: String = user.isMyTurn ? user.name : opponent.name
        print("[\(whosTurn) 턴] \(mukJjiPpaGame.menuMessage)", terminator: "")
    }
    
    func playGame(user: Player, opponent: Player) -> GameType {
        opponent.input = opponent.generateRandomRockScissorPaperInput(gameType: .mukJjiPpaGame)
        user.input = user.readInput(gameType: .mukJjiPpaGame)
        
        switch user.input {
        case .exitGame:
            print("게임 종료")
            return .endGame
        case .rock, .paper, .scissor:
            let gameResult: GameResult = mukJjiPpaGame.decideGameResult(user: user, opponent: opponent)
            let winnerName: String = user.isMyTurn ? user.name : opponent.name
            guard gameResult != .rematch else {
                print("\(winnerName)의 턴입니다.")
                return .mukJjiPpaGame
            }
            print("\(winnerName)의 승리!")
            return .endGame
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
            mukJjiPpaGame.changeTurn(user: user, opponent: opponent, result: .rematch)
            return .mukJjiPpaGame
        }
    }
}
