//
//  MukJjiPpaGame.swift
//  RockPaperScissors
//
//  Created by misung & UngQ on 11/28/23.
//

class MukJjiPpaGame: Playable {
    
    private var rockPaperScissorsGame: RockPaperScissorsGame
    let menuMessage: MenuMessage
    
    init(rockPaperScissorsGame: RockPaperScissorsGame, menuMessage: MenuMessage) {
        self.rockPaperScissorsGame = rockPaperScissorsGame
        self.menuMessage = menuMessage
    }

    func decideGameResult(user: Player, opponent: Player) -> GameResult {
        let rpsGameResult = rockPaperScissorsGame.decideGameResult(user: user, opponent: opponent)
        switch rpsGameResult {
        case .draw:
            return user.isMyTurn ? .win : .lose
        case .win, .lose:
            changeTurn(user: user, opponent: opponent, result: rpsGameResult)
            return .rematch
        default:
            return .rematch
        }
    }
    
    func changeTurn(user: Player, opponent: Player, result: GameResult) {
        switch result {
        case .win:
            user.isMyTurn = true
            opponent.isMyTurn = false
        case .lose:
            user.isMyTurn = false
            opponent.isMyTurn = true
        default:
            user.isMyTurn = false
            opponent.isMyTurn = true
        }
    }
}
