//
//  MJBPlayable.swift
//  RockPaperScissors
//
//  Created by Effie on 11/28/23.
//

import Foundation

protocol MJBPlayable: AnyObject, CallablePlayer {
    func makeMJBDecision() -> MJBDecision
}

protocol CallablePlayer {
    func getName() -> String
}

protocol MJBResultDisplayable {
    func display(result: MJBResult)
}
