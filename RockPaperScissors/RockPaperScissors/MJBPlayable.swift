//
//  MJBPlayable.swift
//  RockPaperScissors
//
//  Created by Effie on 11/28/23.
//

import Foundation

protocol MJBPlayable: AnyObject, MJBResultDisplayable {
    func makeMJBDecision() -> MJBDecision
}

protocol MJBResultDisplayable {
    func displayResult() -> String
}
