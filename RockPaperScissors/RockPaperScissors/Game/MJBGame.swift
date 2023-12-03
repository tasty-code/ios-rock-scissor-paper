//
//  MJBGame.swift
//  RockPaperScissors
//
//  Created by Effie on 11/28/23.
//

struct MJBGame {
    private let leftPlayer: MJBPlayable
    
    private let rightPlayer: MJBPlayable
    
    private var turn: MJBPlayable
    
    private var other: MJBPlayable {
        return self.turn === leftPlayer ? rightPlayer : leftPlayer
    }
    
    init?(rpsWinner: RPSPlayable,rpsLoser: RPSPlayable) {
        guard let turn = rpsWinner as? MJBPlayable,
              let other = rpsLoser as? MJBPlayable else { return nil }
        self.turn = turn
        self.leftPlayer = self.turn
        self.rightPlayer = other
    }
    
    private func getPlayerGestures() throws -> (MJBHand, MJBHand) {
        let turnGesture = try turn.makeMJBGesture(currentTurn: self.turn)
        let otherGesture = try other.makeMJBGesture(currentTurn: self.turn)
        return (turnGesture, otherGesture)
    }
    
    private func displayResult(_ result: MJBResult) {
        [leftPlayer, rightPlayer].forEach { player in
            if let displayablePlayer = player as? MJBResultDisplayable {
                displayablePlayer.display(result: result)
            }
        }
    }
    
    private mutating func changeTurn(to nextTurn: MJBPlayable) {
        self.turn = nextTurn
    }
    
    mutating func start() throws {
        while true {
            let (turnGesture, otherGesture) = try getPlayerGestures()
            let result = MJBPart(turn: turnGesture, other: otherGesture).getResult()
            displayResult(result)
            switch result {
            case .win:
                return
            case .regame(let nextTurn):
                changeTurn(to: nextTurn)
                continue
            }
        }
    }
}
