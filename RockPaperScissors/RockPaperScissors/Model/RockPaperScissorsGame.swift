//
//  RockPaperScissorsGame.swift
//  RockPaperScissors
//
//  Created by Minho on 11/28/23.
//

class RockPaperScissorsGame : Playable {
    
    private let _menuMessage: MenuMessage = .rps
    
    var menuMessage: MenuMessage {
        get {
            return .rps
        }
    }

    func decideGameResult(user: Player, opponent: Player) -> GameResult {
        let gameInfo = (user.input, opponent.input)
        
        if user.input == opponent.input {
            return .draw
        } else if gameInfo == (.rock, .scissor) ||
                  gameInfo == (.paper, .rock) ||
                  gameInfo == (.scissor, .paper) {
            return .win
        } else {
            return .lose
        }
    }
    
    func convertInput(_ input: Int) -> RockPaperScissor{
        switch input {
        case 0:
            return .exitGame
        case 1:
            return .scissor
        case 2:
            return .rock
        case 3:
            return .paper
        default:
            return .noChoice
        }
    }
}
