//
//  MJBPlayable.swift
//  RockPaperScissors
//
//  Created by Effie on 11/28/23.
//

protocol MJBPlayable: AnyObject {
    var name: String { get }
    func makeMJBGesture(currentTurn: MJBPlayable) throws -> MJBHand
}

protocol MJBResultDisplayable {
    func display(result: MJBResult)
}
