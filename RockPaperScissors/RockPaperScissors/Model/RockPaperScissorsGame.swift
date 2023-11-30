//
//  RockPaperScissorsGame.swift
//  RockPaperScissors
//
//  Created by misung & UngQ on 11/28/23.
//

class RockPaperScissorsGame : Playable {
    
    private let _menuMessage: MenuMessage = .rockPaperScissors
    
    var menuMessage: MenuMessage {
        get {
            return .rockPaperScissors
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
}
