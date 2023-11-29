//
//  Game.swift
//  RockPaperScissors
//
//  Created by 장우석 on 11/29/23.
//

import Foundation

protocol Game {
    var controller: Controller { get }
    mutating func play()
}
