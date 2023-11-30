//
//  RockPaperScissorsGameController.swift
//  RockPaperScissors
//
//  Created by misung & UngQ on 11/29/23.
//

class RockPaperScissorsGameController {
    private let rockPaperScissorsGame: RockPaperScissorsGame
    
    init(rockPaperScissorsGame: RockPaperScissorsGame) {
        self.rockPaperScissorsGame = rockPaperScissorsGame
    }
    
    func printMenuMessage() {
        print(rockPaperScissorsGame.menuMessage, terminator: "")
    }
    
    func playGame(user: Player, opponent: Player) -> GameType {
        opponent.input = opponent.randomRockScissorPaperInput(gameType: .rockPaperScissors)
        user.input = user.readInput(gameType: .rockPaperScissors)
        
        switch user.input {
        case .exitGame:
            print("게임 종료")
            return .endGame
        case .rock, .paper, .scissor:
            let gameResult: GameResult = rockPaperScissorsGame.decideGameResult(user: user, opponent: opponent)
            print(gameResult)
            guard gameResult != .draw else { return .rockPaperScissors }
            initPlayersTurn(gameResult: gameResult)
            return .mukJjiPpaGame
        default:
            print("잘못된 입력입니다. 다시 시도해주세요.")
            return .rockPaperScissors
        }
    }
    
    func initPlayersTurn(gameResult: GameResult) {
        switch gameResult {
        case .win:
            user.isMyTurn = true
        case .lose:
            opponent.isMyTurn = true
        default:
            user.isMyTurn = false
            opponent.isMyTurn = false
        }
    }
}
