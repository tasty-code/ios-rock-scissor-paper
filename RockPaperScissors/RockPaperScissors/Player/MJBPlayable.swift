//
//  MJBPlayable.swift
//  RockPaperScissors
//
//  Created by Effie on 11/28/23.
//

import Foundation

protocol MJBPlayable: AnyObject, CallablePlayer {
    func makeMJBGesture(currentTurn: MJBPlayable) throws -> MJBHand
}

protocol MJBResultDisplayable {
    func display(result: MJBResult)
}

protocol CallablePlayer {
    var name: String { get }
}
