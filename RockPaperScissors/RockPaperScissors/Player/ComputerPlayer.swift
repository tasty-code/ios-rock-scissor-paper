//
//  ComputerPlayer.swift
//  RockPaperScissors
//
//  Created by Effie on 11/28/23.
//

final class ComputerPlayer: HandGamePlayable {
    let name = "컴퓨터"
    
    func makeRPSGesture() throws -> RPSHand {
        let hand = Hand.randomize()
        return RPSHand(hand: hand, owner: self)
    }
    
    func makeMJBGesture(currentTurn: MJBPlayable) throws -> MJBHand {
        let hand = Hand.randomize()
        return MJBHand(hand: hand, owner: self)
    }
}
