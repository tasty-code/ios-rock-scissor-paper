//
//  ComputerPlayer.swift
//  RockPaperScissors
//
//  Created by Effie on 11/28/23.
//

import Foundation

final class ComputerPlayer: HandGamePlayable {
    let name = "컴퓨터"
    
    func makeRPSGesture() throws -> RPSGesture {
        let hand = Hand.randomize()
        return RPSGesture(hand: hand, owner: self)
    }
    
    func makeMJBGesture(currentTurn: MJBPlayable) throws -> MJBGesture {
        let hand = Hand.randomize()
        return MJBGesture(hand: hand, owner: self)
    }
}

extension ComputerPlayer: CallablePlayer {
    func getName() -> String {
        return self.name
    }
}
