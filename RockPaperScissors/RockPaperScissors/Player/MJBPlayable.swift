//
//  MJBPlayable.swift
//  RockPaperScissors
//
//  Created by Effie on 11/28/23.
//

import Foundation

protocol MJBPlayable: AnyObject, CallablePlayer {
    func makeMJBDecision(currentTurn: MJBPlayable) -> MJBDecision
}

protocol MJBResultDisplayable {
    func display(result: MJBResult)
}

protocol CallablePlayer {
    var name: String { get }
}
