//
//  RockPaperScissorsGame.swift
//  RockPaperScissors
//
//  Created by misung & UngQ on 11/28/23.
//

class RockPaperScissorsGame : Playable {
    
    let menuMessage: MenuMessage
    
    init (menuMessage: MenuMessage) {
        self.menuMessage = menuMessage
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
