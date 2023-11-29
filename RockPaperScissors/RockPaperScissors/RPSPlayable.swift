//
//  Playable.swift
//  RockPaperScissors
//
//  Created by Effie on 11/28/23.
//

import Foundation

typealias HandGamePlayable = RPSPlayable & MJBPlayable

protocol RPSPlayable: AnyObject {
    func makeRPSDecision() -> RPSDecision
}

protocol RPSResultDisplayable {
    func display(result: RPSResult)
}
