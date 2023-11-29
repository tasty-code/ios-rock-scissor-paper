//
//  Playable.swift
//  RockPaperScissors
//
//  Created by Effie on 11/28/23.
//

import Foundation

protocol RPSPlayable: AnyObject {
    func makeRPSDecision() -> RPSDecision
}

protocol RPSResultDisplayable {
    func display(result: RPSResult)
}
