//
//  Playable.swift
//  RockPaperScissors
//
//  Created by Effie on 11/28/23.
//

protocol RPSPlayable: AnyObject {
    func makeRPSGesture() throws -> RPSHand
}

protocol RPSResultDisplayable {
    func display(result: RPSResult)
}

typealias HandGamePlayable = RPSPlayable & MJBPlayable
