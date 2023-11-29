//
//  Controller.swift
//  RockPaperScissors
//
//  Created by 장우석 on 11/29/23.
//

import Foundation

protocol Controller {
    var view: View { get }
    var resultDict: Dictionary<Match, () -> ()> { get set }
    mutating func process()
    func userInput() -> RockPaperScissors
}
