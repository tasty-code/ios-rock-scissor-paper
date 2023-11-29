//
//  MukJjiPpaGame.swift
//  RockPaperScissors
//
//  Created by Minho on 11/28/23.
//

class MukJjiPpaGame : Playable {
    
    private var rpsGame: RockPaperScissorsGame
    private let _menuMessage: MenuMessage = .rps
    
    init(rpsGame: RockPaperScissorsGame) {
        self.rpsGame = rpsGame
    }
    
    var menuMessage: MenuMessage {
        get {
            return .mjb
        }
    }

    func decideGameResult(user: Player, opponent: Player) -> GameResult {
        if user.input == opponent.input {
            return user.isMyTurn ? .win : .lose
        } else {
            let rpsGameResult = rpsGame.decideGameResult(user: user, opponent: opponent)
            changeTurn(user: user, opponent: opponent, result: rpsGameResult)
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
    
    func convertInput(_ input: Int) -> RockPaperScissor{
        switch input {
        case 0:
            return .exitGame
        case 1:
            return .rock
        case 2:
            return .scissor
        case 3:
            return .paper
        default:
            return .noChoice
        }
    }
}
